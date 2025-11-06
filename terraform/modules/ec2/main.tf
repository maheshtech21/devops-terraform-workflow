resource "aws_instance" "sshhost" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  key_name                    = var.aws_key_pair
  associate_public_ip_address = true
  tags = { Name = "${var.project_name}-sshhost" }
}

resource "aws_instance" "app" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.app_sg_id]
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = var.aws_key_pair
  associate_public_ip_address = false
  tags = { Name = "${var.project_name}-app-server" }
}
