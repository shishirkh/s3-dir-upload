const AWS = require("aws-sdk");
const path = require("path");
const fs = require("fs");

const uploadDir = async (uploadDirPath, s3Path) => {
  let s3 = new AWS.S3({
    region: "us-east-1",
    credentials: {
      accessKeyId: "b702934591134c3da0de39dc52da29f8",
      secretAccessKey: "b81c0f79996d46dda7b0a883cc213cdf",
    },
    sslEnabled: false,
    s3ForcePathStyle: false,
    signatureVersion: "v4",
    endpoint: 'http://vsa-0000001d-rakuten-kiba-01.zadarazios.com/'
  });
  await uploadFiles(s3, getAllFile(uploadDirPath), s3Path);
  console.log("File uploaded");
};

const uploadFiles = async (s3, files, s3Path) => {
  try {
    const promises = files.map((file) => {
      let bucketPath = s3Path + file.path;
      console.log(bucketPath);
      let params = {
        Bucket: "katana-dev-s",
        Key: bucketPath,
        Body: fs.readFileSync(file.path),
      };
      return s3.putObject(params).promise();
    });
    await Promise.all(promises);
  } catch (error) {
    console.log(error);
  }
};

const getAllFile = (uploadDirPath) => {
  let files = [];
  fs.readdirSync(uploadDirPath).forEach((name) => {
    const filePath = path.join(uploadDirPath, name);
    const stat = fs.statSync(filePath);
    if (stat.isFile()) {
      files.push({ stat, path: filePath });
    } else if (stat.isDirectory()) {
      files = files.concat(getAllFile(filePath));
    }
  });
  return files;
};

uploadDir("./assets", "loadUploadTest/");
