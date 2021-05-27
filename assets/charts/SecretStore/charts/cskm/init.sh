#!/bin/bash

# Uncomment it for script debugging
# set -x

function check_tools () {
    secho "Checking if all tools are available ..."
    for i in kubectl curl grep tr cut; do
        if ! command -v $i > /dev/null 2>&1 ; then
            secho "Failed to find \'$i\' in PATH\!"
            exit -1
        fi
    done
    secho "All tools are available"

}

function secho() 
{
  if [ "$out_token_only" = false ]; then
    echo "$1"  
  fi
}

function usage()
{
  echo "usage: init.sh RELEASE-NAME NAME-SPACE [--out-token-only]"
}

###### main ######

### parse command line

if [ "$#" -lt 2 ]; then
  usage 
  exit -1
fi

release=$1
namespace=$2

shift
shift

out_token_only=false

while [ "$1" != "" ]; do
#  echo $1
  case $1 in
#      -f | --file )           shift
#                              filename=$1
#                              ;;
      --out-token-only )      out_token_only=true
                              ;;
      -h | --help )           usage
                              exit
                              ;;
      * )                     shift
  esac
  shift
done

secho release: ${release}
secho namespace: ${namespace}
secho "out_token_only: ${out_token_only}"

secho "Init script started"

check_tools

# ckeck kubectl works 

out="$(kubectl version)"
if [ -z "$out" ]; then
  echo out
  echo "'kubectl version' returned error. May be you need to run this scrips as sudo"
  exit -1
fi

# Wait till first CSKM pod started
for i in {1..100}; do
  secho "Checking if cskm pod started. Attempt ${i}."
  tmp=`kubectl get pods --namespace ${namespace} -o wide | grep $release-cskm-0 | tr -s [:space:] | cut -f6 -d' '`
  IFS=', ' read -r -a array <<< "${tmp}"
  arr_size=${#array[@]}
  if [ "$arr_size" -gt 0 ]; then
    if [ "${array[0]}" != "<none>" ]; then
      pod_ip=${array[0]}
      secho "Pod ip found: $pod_ip"
      break
    fi
  fi
  sleep 5
done
          
secret_name="$(kubectl --namespace $namespace get secret | grep $release-cskm-secret | tr -s [:space:] | cut -f1 -d' ')"

# Check vault is already inited
set +e 
for i in {1..60}; do
  secho "Checking if vault is available. Attempt ${i}."
  out="$(curl --insecur -s https://${pod_ip}:8200/v1/sys/init)"
  secho "${out}"
  if [ ! -z "$out" ]; then
    break
  fi
  sleep 5
done
set -e

if [ -z "$out" ]; then
  secho "Vault is not available. Exiting."
  exit -1
fi

secho "Vault is available"

if [[ ! "$out" == "{\"initialized\":false}" ]]; then
  secho "Vault already initialized. Exiting."
  exit 0
fi

secho "Initializing Vault..."

out="$(curl --insecur -s --request PUT --data '{"secret_shares": 1, "secret_threshold": 1}' https://${pod_ip}:8200/v1/sys/init)"
secho " "
secho "Initialization result:"
secho "${out}"
secho " "

encryption_key="$(echo ${out} | cut -f4 -d'"')"
root_token="$(echo ${out} | cut -f12 -d'"')"

#secho " "
#secho "encryption_key:"
#secho "${encryption_key}"
#secho "root_token:"
#secho "${root_token}"
echo "Token:${root_token}"
secho " "

secho "Deleting existing Vault secret..."
kubectl --namespace $namespace delete secret ${secret_name} --ignore-not-found=true &>/dev/null 

secho "Addind encription key as secret"
kubectl --namespace $namespace create secret generic ${secret_name} --from-literal=unslkey="${encryption_key}" --from-literal=token="${root_token}" &>/dev/null
secho "Secret added"

# restart Vault pods 
secho "Vault is initialized. Encryption key added as secret."
secho "But Vault is still sealed."
secho "Run this command: 'helm upgrade cskm --recreate-pods'"
secho "Vault pods will be restarted with new secret any unseal themselves"

secho " "
secho "Init script finished"
