data "aws_ami" "ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["${var.ami_name_pattern}"]
  }
}


resource "aws_instance" "Master-Node" {
  ami                         = "${data.aws_ami.ami.id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_pair}"
  vpc_security_group_ids      = ["${aws_security_group.ec2-sg.id}"]
  subnet_id                   = "${element(random_shuffle.subnet.result,0)}"
  user_data                   = "${data.template_file.user_data.rendered}"
  iam_instance_profile        = "${aws_iam_instance_profile.ec2-profile.id}"
  user_data                   = "${data.template_file.user_data.rendered}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  count                       = "1"
  root_block_device {
    volume_type           = "${var.root_vol_type}"
    volume_size           = "${var.root_vol_size}"
    delete_on_termination = "${var.root_vol_delete_on_termination}"
  }
  tags = {
    Name      = "Master Node"
    Team      = "${var.Team}"
    Environment       = "${var.Environment}"
    Service   = "${var.Service}"
    App       = "${var.App}"
    Terraform = true
    Business_Vertical = "${var.Business_Vertical}"
    Owner = "${var.Owner}"
    Monitor   = "yes"
    Monitor_APP = "${var.Monitor_APP}"
    Project = "${var.Team}-${var.App}-${var.Service}-${var.Environment}"
  }
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt -y update"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.Master-Node.public_ip} >> ip_address.txt"
  }
}
}

resource "aws_instance" "Worker-Node" {
  ami                         = "${data.aws_ami.ami.id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_pair}"
  vpc_security_group_ids      = ["${aws_security_group.ec2-sg.id}"]
  subnet_id                   = "${element(random_shuffle.subnet.result,0)}"
  user_data                   = "${data.template_file.user_data.rendered}"
  iam_instance_profile        = "${aws_iam_instance_profile.ec2-profile.id}"
  user_data                   = "${data.template_file.user_data.rendered}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  count                       = "${var.count}"
  root_block_device {
    volume_type           = "${var.root_vol_type}"
    volume_size           = "${var.root_vol_size}"
    delete_on_termination = "${var.root_vol_delete_on_termination}"
  }
  tags = {
    Name      = "Worker Node"
    Team      = "${var.Team}"
    Environment       = "${var.Environment}"
    Service   = "${var.Service}"
    App       = "${var.App}"
    Terraform = true
    Business_Vertical = "${var.Business_Vertical}"
    Owner = "${var.Owner}"
    Monitor   = "yes"
    Monitor_APP = "${var.Monitor_APP}"
    Project = "${var.Team}-${var.App}-${var.Service}-${var.Environment}"
  }
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt -y update"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.Worker-Node.public_ip} >> ip_address.txt"
  }
}


