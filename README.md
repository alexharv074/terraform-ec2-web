# EC2 Nginx proof of concept

## Overview

This simple project is a proof of concept demonstrating a minimal configuration Nginx + EC2 instance + Elastic IP (EIP) serving "hello world". Terraform is used to create the EC2 instance and UserData is used to install Nginx on an Amazon Linux machine image (AMI). Serverspec is used to provide a simple automated acceptance test.

## Dependencies

It is expected that you already have installed:

- Terraform >= 0.12
- Bundler (for Serverspec)

A system Ruby is expected to be installed too (again, for Serverspec).

## Usage

Spin up the EC2 instance:

```text
▶ terraform init
▶ terraform apply
```

The Elastic IP (EIP) is emitted as an output:

```text
hello_url = 13.162.21.45
```

To connect:

```text
▶ curl http://13.162.21.45
hello world
```

To destroy the stack again and save on your AWS bill:

```text
▶ terraform destroy
```

## Test runner

To run the suite of automated acceptance tests:

```text
▶ bash -x test_runner.sh
```

For more info see [the code](./test_runner.sh).
