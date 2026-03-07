# EC2 Automation using AWS CLI & Bash

## 📌 Objective

Automate the creation of an EC2 instance using Bash and AWS CLI.

This project simulates a real-world scenario where a Cloud Administrator provisions servers using automation instead of the AWS console.

---

# 🛠 Requirements

Before running the script, ensure the following are available:

* AWS CLI
* Bash
* AWS Account

---

# 1️⃣ Install AWS CLI

Follow the official AWS CLI installation guide:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

This guide includes installation instructions for:

* Linux
* macOS
* Windows

### Verify installation

```bash
aws --version
```

---

# 2️⃣ Configure AWS Credentials

Run the following command:

```bash
aws configure
```

Enter your credentials:

```
AWS Access Key ID
AWS Secret Access Key
Default region name (example: us-east-1)
Default output format (json)
```

---

# 3️⃣ Clone Repository

```bash
git clone https://github.com/irfansadiq030/devops-bash-scripts.git
cd devops-bash-scripts/projects/ec2-cli-automation
```

---

# 4️⃣ Update Script Variables

Edit the script and update the required values.

```bash
nano create_ec2.sh
```

Example variables inside the script:

```bash
AMI_ID="ami-xxxxxxxx"
INSTANCE_TYPE="t2.micro"
KEY_NAME="your-keypair"
SECURITY_GROUP="sg-xxxxxx"
SUBNET_ID="subnet-xxxxxx"
```

---

# 5️⃣ Give Execute Permission

```bash
chmod +x create_ec2.sh
```

---

# 6️⃣ Run Script

```bash
./create_ec2.sh
```

If everything is configured correctly, an EC2 instance will be created.

---

# ⚠️ Notes

* Ensure your IAM user has EC2 permissions.
* Ensure the key pair exists in the selected region.

---
