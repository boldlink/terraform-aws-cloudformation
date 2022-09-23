module "cloudformation_stack" {
  source        = "./../../"
  stack_name    = "cloudformation-minimal"
  template_body = <<STACK
{
  "Parameters" : {
    "VPCCidr" : {
      "Type" : "String",
      "Default" : "10.0.0.0/16",
      "Description" : "Enter the CIDR block for the VPC. Default is 10.0.0.0/16."
    }
  },
  "Resources" : {
    "myVpc": {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : { "Ref" : "VPCCidr" },
        "Tags" : [
          {"Key": "Name", "Value": "Primary_CF_VPC"}
        ]
      }
    }
  }
}
STACK
  on_failure    = "ROLLBACK"
  parameters = {
    VPCCidr = "10.0.0.0/16"
  }

  tags = {
    Name        = "Minimal cloudformation stack"
    Environment = "dev"
  }
  timeouts = {
    create = "20m"
    update = "15m"
    delete = "10m"
  }
}
