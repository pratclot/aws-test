# The Jedi Council

This PoC achieves the following:
- accepts a "manifest" from the Council
- processes it and "logs" the location of a certain Jedi

The Jedi is mentioned separately by the Council via an ID, which corresponds to an entry in the "manifest".

Included `terraform` code will deploy:
- an encrypted `secret`
- an EventBridge `bus`
- a `rule` that triggers a `lambda`
- a `queue` which serves as a DLQ for the `bus`
- the `lambda` which "logs" the Jedi info
- a CloudWatch `log group` which will hold the Jedi info

These entities establish a process to convert an "event" (arrives at the `bus`) to a "log" record (done by the `lambda`).  The "events" (Council "manifest" updates) are emulated by hand and are not a part of the IaC.

## How to use

First of all, since one of the requirements is to use a CMK, we need to create it. This is a painful process described [here](https://repost.aws/knowledge-center/invalidciphertext-kms) (let alone automating this with `terraform`. Maybe there is already a module written by some good soul, but I figured it does not really matter for this PoC, unless of course I was supposed to create such a module. I did not see such a requirement though). For the purposes of this exercise, the key is assumed to be pre-created.

Set up the KMS key coordinates in the root `variables.tf`:
- `kms_key_id`
- `kms_key_arn`

Also do not forget `accountID`.

Deploy everything to AWS:
```bash
cd iac
terraform init
terraform apply
cd -
```

Set the desired secret value (should be the same as `jedi_secret_name` in the root variables):
```bash
aws secretsmanager put-secret-value --secret-id jedi_id_3 --secret-string 12345
```

Prepare to receive `lambda` execution results (the log group name should correspond to `jedi_lambda_log_sink_name` root variable):

```bash
./tail_logs.sh
```

And then trigger the `events` (`events.json` mentions which event bus to use, it should be the same as `event_bus_name` root variable):
```bash
./send_events.sh
```

Or just send them thru the Web Console, which works fine with the `event.json` file used for development of the Lambda. The script invokes `aws` which [clearly](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/events/put-events.html#examples) has different expectations of the payload. This explains the presence of a separate `events.json` file :)

## Features

- [x] the `lambda` can be debugged locally via VSCode's launch configuration
- [x] the project follows `some` of Google's [best practices](https://cloud.google.com/docs/terraform/best-practices-for-terraform) for repo organization (naming unique resources `main`, grouping resources logically, describing variables)
- [x] the most important practice is what HashiCorp calls "module composition" which results in a 1-level deep hierarchy of modules (i.e. they are all consumed by the `root` module).
- [x] on top of that, "dependency inversion" allows to pass data from one such module to another thru the `root` module (in programming this would actually be called encapsulation and single responsibility principle)
