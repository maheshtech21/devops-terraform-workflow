resource "random_id" "rand" {
  byte_length = 4 
}

resource "aws_s3_bucket" "app_bucket" {
  bucket        = "${var.project_name}-private-bucket-${random_id.rand.hex}"
  force_destroy = true
  tags          = { Name = "${var.project_name}-bucket" }
}

resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2-s3-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "s3_policy" {
  name = "${var.project_name}-s3-policy"
  role = aws_iam_role.ec2_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["s3:*"],
      Resource = "*"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}
