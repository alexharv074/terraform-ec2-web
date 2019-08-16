#!/usr/bin/env bash

if ! command -v terraform ; then
  echo "Terraform binary not found."
  exit 1
fi

if ! command -v bundle ; then
  echo "Bundler does not appear to be installed."
  exit 1
fi

deploy() {
  terraform init
  terraform apply -auto-approve
}

wait_for_service() {
  sleep 30
}

run_tests() {
  bundle install
  bundle exec rspec -f d spec/localhost/test_spec.rb
}

teardown() {
  terraform destroy -auto-approve
}

deploy
wait_for_service
run_tests
teardown

# vim: set ft=sh:
