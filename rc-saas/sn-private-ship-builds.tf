resource "aws_security_group" "sg_private_ship_builds" {
  name = "sg_private_ship_builds_${var.install_version}"
  description = "Private Subnet for security group builds"
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = [
      "${var.cidr_public_ship}",
      "${var.cidr_private_ship_install}"
      ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags {
    Name = "sg_private_ship_builds_${var.install_version}"
  }
}

resource "aws_instance" "shared_pool_x86_u1404_01" {
  ami = "${var.ami_us_east_1_ubuntu1404}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
    delete_on_termination = true
  }

  tags = {
    Name = "shared_pool_x86_u1404_01_${var.install_version}"
  }
}

output "shared_pool_x86_u1404_01" {
  value = "${aws_instance.shared_pool_x86_u1404_01.private_ip}"
}

resource "aws_instance" "shared_pool_x86_u1604_01" {
  ami = "${var.ami_us_east_1_ubuntu1604}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
    delete_on_termination = true
  }

  tags = {
    Name = "shared_pool_x86_u1604_01_${var.install_version}"
  }
}

output "shared_pool_x86_u1604_01" {
  value = "${aws_instance.shared_pool_x86_u1604_01.private_ip}"
}

resource "aws_instance" "admiral_test_u1604_bharath92" {
  ami = "${var.ami_us_east_1_ubuntu1604}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
    delete_on_termination = true
  }

  tags = {
    Name = "admiral_test_u1604_bharath92_${var.install_version}"
  }
}

output "admiral_test_u1604_bharath92" {
  value = "${aws_instance.admiral_test_u1604_bharath92.private_ip}"
}

## centOs test instance Rituraj
resource "aws_instance" "rituraj_x86_64_c7" {
  ami = "${var.ami_us_east_1_centos7}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "rituraj_x86_64_c7_${var.install_version}"
  }
}

output "rituraj_x86_64_c7" {
  value = "${aws_instance.rituraj_x86_64_c7.private_ip}"
}

## centOS test instance Niranjan
resource "aws_instance" "niranjan_x86_64_c7" {
  ami = "${var.ami_us_east_1_centos7}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "niranjan_x86_64_c7_${var.install_version}"
  }
}

output "niranjan_x86_64_c7" {
  value = "${aws_instance.niranjan_x86_64_c7.private_ip}"
}

## resource "aws_instance" "rancher_dev_bharath92" {
##   ami = "${var.ami_us_east_1_rancheros}"
##   availability_zone = "${var.avl-zone}"
##   instance_type = "${var.in_type_core}"
##   key_name = "${var.aws_key_name}"
##   subnet_id = "${aws_subnet.sn_ship_install.id}"
##   vpc_security_group_ids = [
##    "${aws_security_group.sg_private_ship_builds.id}"]
##   root_block_device {
##    volume_type = "gp2"
##    volume_size = 50
##    delete_on_termination = true
##   }
##   tags = {
##    Name = "rancher_dev_bharath92_${var.install_version}"
##   }
## }
##
## output "rancher_dev_bharath92" {
##   value = "${aws_instance.rancher_dev_bharath92.private_ip}"
## }


## CENTOS 7 test-instance
#resource "aws_instance" "test_instance_centos_7_rituraj" {
#  ami = "${var.ami_us_east_1_centos7}"
#  availability_zone = "${var.avl-zone}"
#  instance_type = "${var.in_type_core}"
#  key_name = "${var.aws_key_name}"
#  subnet_id = "${aws_subnet.sn_ship_install.id}"
#
#  vpc_security_group_ids = [
#   "${aws_security_group.sg_private_ship_builds.id}"]
#
#  root_block_device {
#    volume_type = "gp2"
#    volume_size = 50
#    delete_on_termination = true
#  }
#
#  tags = {
#    Name = "test_instance_centos_7_rituraj"
#  }
#}
#
#output "test_instance_centos_7_rituraj" {
#  value = "${aws_instance.test_instance_centos_7_rituraj.private_ip}"
#}

resource "aws_instance" "admiral_test_master" {
  ami = "${var.ami_us_east_1_ubuntu1404}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_small}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "admiral_test_master_${var.install_version}"
  }
}

output "admiral_test_master" {
  value = "${aws_instance.admiral_test_master.private_ip}"
}

resource "aws_instance" "admiral_test_components" {
  ami = "${var.ami_us_east_1_ubuntu1404}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_small}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "admiral_test_components_${var.install_version}"
  }
}

output "admiral_test_components" {
  value = "${aws_instance.admiral_test_components.private_ip}"
}

resource "aws_instance" "admiral_test_swarm_worker" {
  ami = "${var.ami_us_east_1_ubuntu1404}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_small}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "admiral_test_swarm_worker_${var.install_version}"
  }
}

output "admiral_test_swarm_worker" {
  value = "${aws_instance.admiral_test_swarm_worker.private_ip}"
}

resource "aws_instance" "grisham_dev_instance_ric03uec_u1404_01" {
  ami = "${var.ami_us_east_1_ubuntu1404}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_small}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "grisham_dev_instance_ric03uec_u1404_01_${var.install_version}"
  }
}

output "grisham_dev_instance_ric03uec_u1404_01" {
  value = "${aws_instance.grisham_dev_instance_ric03uec_u1404_01.private_ip}"
}

resource "aws_instance" "test_instance_ric03uec_u1604" {
  ami = "${var.ami_us_east_1_ubuntu1604}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "test_instance_ric03uec_u1604_${var.install_version}"
  }
}

output "test_instance_ric03uec_u1604" {
  value = "${aws_instance.test_instance_ric03uec_u1604.private_ip}"
}

resource "aws_instance" "test_instance_centos_7_ric03uec" {
  ami = "${var.ami_us_east_1_centos7}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_ship_install.id}"

  vpc_security_group_ids = [
   "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "test_instance_centos_7_ric03uec"
  }
}

output "test_instance_centos_7_ric03uec" {
  value = "${aws_instance.test_instance_centos_7_ric03uec.private_ip}"
}

resource "aws_instance" "chaitanya_u1404" {
  ami = "${var.ami_us_east_1_ubuntu1404}"
  availability_zone = "${var.avl-zone}"
  instance_type = "${var.in_type_core}"
  key_name = "${var.aws_key_name}"
  subnet_id = "${aws_subnet.sn_public.id}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_private_ship_builds.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    delete_on_termination = true
  }

  tags = {
    Name = "chaitanya_u1404_${var.install_version}"
  }
}

output "chaitanya_u1404" {
  value = "${aws_instance.chaitanya_u1404.private_ip}"
}
