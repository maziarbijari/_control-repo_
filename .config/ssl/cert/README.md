To access your puppet server you have to retrieve the servers certificate.


Execute from the root folder of your starterkit:

```
aws --region=us-east-1 opsworks-cm describe-servers --server-name puppetsrv --query "Servers[0].EngineAttributes[?Name=='PUPPET_API_CA_CERT'].Value" --output text > .config/ssl/cert/ca.pem
```
