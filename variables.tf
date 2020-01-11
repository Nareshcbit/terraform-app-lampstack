variable "region" {

    type = "string"
    default = "ap-south-1"

}


variable "web_subnet_id" { default = "subnet-0d66acf329840523a"}
variable "web_security_group_ids" {
  type    = list(string)
  default = ["sg-0765bac04d5e36b11"]
}

variable "owner" { default = "Naresh Madiraju"}

variable "global_tags" {
    type = "map"
    default = {
        business_unit = "corp"
        department =  "cloud-engineering",
        team = "cloud-engineering",
        cost_center ="100786",
  }
}

variable "app_tags" {
    type = "map"
    default = {
        app = "reporting-cto",
        env = "development"
  }
}

variable "opt_tags" {
    type = "map"
    default = {
        maintenance_window = "Friday 03:00 AM - Friday 09:00 AM",
        auto_approvals = "CORP, COSTOP"
  }
}
