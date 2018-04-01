#!/bin/sh

set -x

BUCKET_NAME=$1
LEGION=${2:-ap-northeast-1}

EXISTS=`aws s3api head-bucket --bucket ${BUCKET_NAME} 2>&1`

if test "${EXISTS}" != "";then
    aws s3api create-bucket --bucket $BUCKET_NAME --create-bucket-configuration LocationConstraint=$LEGION
fi

aws s3api put-bucket-versioning --bucket $BUCKET_NAME --versioning-configuration Status=Enabled

aws s3api put-bucket-encryption --bucket $BUCKET_NAME --server-side-encryption-configuration '{
  "Rules": [
    {
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }
  ]
}'

aws s3api get-bucket-location --bucket $BUCKET_NAME
aws s3api get-bucket-versioning --bucket $BUCKET_NAME
aws s3api get-bucket-encryption --bucket $BUCKET_NAME
