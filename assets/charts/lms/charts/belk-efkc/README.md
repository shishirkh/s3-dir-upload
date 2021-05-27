This is an umbrella helm chart to start the following instances of services:
- Fluentd on each node as daemon set
- Elasticsearch cluster with data, master and clients services
- Kibana as GUI to present elasticsearch content
- Curator to keep indices healthy
