# ☁️ CV Hosting on AWS — Terraform Infrastructure

A production-ready Infrastructure as Code (IaC) setup to host a static CV/resume on AWS using **S3 + CloudFront**, provisioned entirely with Terraform.

---

## 🏗️ Architecture

```
Browser → CloudFront (HTTPS) → S3 Bucket (private)
```

- **S3** stores the static `index.html` (CV file) — bucket is private, not publicly accessible
- **CloudFront** serves it globally over HTTPS with OAC (Origin Access Control), the modern replacement for OAI
- **IAM Bucket Policy** ensures only CloudFront can read from S3

---

## 🚀 Stack

| Tool | Purpose |
|---|---|
| Terraform | Infrastructure provisioning |
| AWS S3 | Static file hosting |
| AWS CloudFront | CDN + HTTPS + global distribution |
| AWS IAM | Secure access policy between services |

> Region: `eu-west-1` (Ireland 🇮🇪)

---

## 📁 Project Structure

```
.
├── main.tf        # All infrastructure resources
├── index.html     # Your CV (uploaded to S3 via Terraform)
└── README.md
```

---

## ⚙️ How to Deploy

**Prerequisites:**
- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- AWS CLI configured (`aws configure`)

```bash
# 1. Clone the repo
git clone https://github.com/your-username/your-repo.git
cd your-repo

# 2. Initialize Terraform
terraform init

# 3. Preview the plan
terraform plan

# 4. Deploy
terraform apply
```

After apply, grab your CloudFront URL from the output or AWS Console and access your CV at:

```
https://<cloudfront-distribution-id>.cloudfront.net
```

---

## 🔒 Security

- S3 bucket is **fully private** — no public access
- CloudFront accesses S3 via **Origin Access Control (OAC)** with `sigv4` signing
- All traffic is **redirected to HTTPS** automatically
- IPv6 enabled

---

## 🧹 Teardown

```bash
terraform destroy
```

---

## 👤 Author

**Artur Wagner**
[LinkedIn](https://www.linkedin.com/in/arturwagnerdev/) · [trendcode.ie](https://trendcode.ie)

More soon
