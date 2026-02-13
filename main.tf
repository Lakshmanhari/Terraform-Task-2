provider "aws" {
    alias = "mumbai"
    region = "ap-south-1"

}
provider "aws" {
    alias = "virginia"
    region = "us-east-1"
  
}
resource "aws_instance" "Mumbai_Server" {
  provider      = aws.mumbai
  ami           = "ami-019715e0d74f695be"
  instance_type = "t3.micro"
  key_name      = "newkeypair"

  vpc_security_group_ids = [aws_security_group.web_sg_mumbai.id]

  tags = {
    Name = "Mumbai-Server"
  }
user_data = <<-EOF
   #!/bin/bash
   export DEBIAN_FRONTEND=noninteractive
   apt-get update -y
   apt-get install -y nginx
   systemctl start nginx
   systemctl enable nginx
EOF


}

resource "aws_instance" "Virginia_Server" {
  provider      = aws.virginia
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"
  key_name      = "virginia_keypair"

  vpc_security_group_ids = [aws_security_group.web_sg_virginia.id]

  tags = {
    Name = "Virginia-Server"
  }
user_data = <<-EOF
   #!/bin/bash
   export DEBIAN_FRONTEND=noninteractive
   apt-get update -y
   apt-get install -y nginx
   systemctl start nginx
   systemctl enable nginx
EOF

}