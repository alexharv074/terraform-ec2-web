#!/usr/bin/env bash
terraform init
terraform apply -auto-approve
bundle install
bundle exec rspec -f d spec/localhost/test_spec.rb
terraform destroy
