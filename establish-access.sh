#!/bin/bash
set -euo pipefail

function download_certificate() {
  echo "Downloading server certificate for server puppetsrv."
  aws --region=ap-southeast-2 opsworks-cm describe-servers --server-name puppetsrv \
--query "Servers[0].EngineAttributes[?Name=='PUPPET_API_CA_CERT'].Value" \
--output text >| .config/ssl/cert/ca.pem

}

function generate_access_token() {
  echo "Generating puppet access token for server puppetsrv."
  puppet-access login --config-file .config/puppetlabs/client-tools/puppet-access.conf --lifetime 8h
}

download_certificate
generate_access_token