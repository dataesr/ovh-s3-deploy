#!/bin/sh -l

set -e
echo "Config aws client"
cat > ~/.aws/config << EOF
[plugins]
endpoint = awscli_plugin_endpoint

[profile default]
region = $REGION
s3 =
  endpoint_url = $ENDPOINT
  signature_version = s3v4
s3api =
  endpoint_url = $ENDPOINT
EOF

cat > ~/.aws/credentials << EOF
[default]
aws_access_key_id = $ACCESS_KEY
aws_secret_access_key = $SECRET_KEY
EOF

echo "Config s3 bucket"
if aws s3api head-bucket --bucket $BUCKET 2>/dev/null;
then
  echo "Creating bucket $BUCKET"
  aws mb s3://$BUCKET --acl public-read

aws s3 website s3://$BUCKET --error-document index.html --index-document index.html

echo "Syncing $SOURCE with $BUCKET"
aws s3 sync $SOURCE --delete --acl public-read

# echo "deployment=$BUCKET" >> $GITHUB_OUTPUT
