#!/bin/bash
set -e   # exit immediately if any command fails

INSTANCE_TYPE="t3.micro"
AMI_ID="ami-0ba8d27d35e9915fb"
KEY_NAME="irfans-cloud"   # KEY PAIR NAME
SECURITY_GROUP_ID="sg-0727e36d71d02c450"   # SECURITY GROUP ID
INSTANCE_NAME="MyEC2Instance"   # INSTANCE NAME

INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SECURITY_GROUP_ID" \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --query "Instances[0].InstanceId" \
  --output text)

echo "✅ EC2 instance created successfully!"
echo "🆔 Instance ID: $INSTANCE_ID"