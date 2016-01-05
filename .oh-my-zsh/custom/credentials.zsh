# we set a bunch of credentials that we use in our tools here
export AWS_CREDENTIAL_FILE=~/.aws/credentials
export CHEF_REPO=~/projects/chef-repo
export AWS_ACCESS_KEY_ID=`grep aws_access_key_id ~/.aws/config | awk '{print $3}'`
export AWS_SECRET_ACCESS_KEY=`grep aws_secret_access_key ~/.aws/config | awk '{print $3}'`
export AWS_DEFAULT_REGION="us-east-1"
export TF_VAR_aws_access_key="$AWS_ACCESS_KEY_ID"
export TF_VAR_aws_secret_key="$AWS_SECRET_ACCESS_KEY"

