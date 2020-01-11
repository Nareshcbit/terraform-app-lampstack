output "image_id" {
    value = "${data.aws_ami.latest-ubuntu.id}"
}

output "web_instance_ids"{

  value = "${module.web.id}"
}

output "web_instance_arns"{

  value = "${module.web.arn}"
}
