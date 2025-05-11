# ---------------------------
# DATA SOURCE TO FETCH LATEST AMAZON LINUX AMI
# ---------------------------
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

# ---------------------------
# EC2 INSTANCE USING DATA SOURCE AMI
# ---------------------------
resource "aws_instance" "data_sourcing" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
}
