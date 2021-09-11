## Configuration file for providers, only using AWS at this time
## using version 1 before current 3.58 from https://registry.terraform.io/providers/hashicorp/aws/latest
resource "aws_elasticsearch_domain" "skills_server" {
  domain_name           = "beeroclock"
  elasticsearch_version = "7.10"

  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    dedicated_master_enabled = "true"
    dedicated_master_type    = "t2.small.elasticsearch"
    dedicated_master_count   = "2"
    zone_awareness_enabled   = "false"
    instance_count           = "1"
  }

  ebs_options {
    ebs_enabled = "true"
    volume_type = "gp2"
    volume_size = "10"
  }

access_policies = <<CONFIG
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "es:*"
      ],
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": [
            "*"
          ]
        }
      },
      "Resource": "arn:aws:es:us-west-2:264839580764:domain/beeroclock/*"
    }
  ]
}
CONFIG
}