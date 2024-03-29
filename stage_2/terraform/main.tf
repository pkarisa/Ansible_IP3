resource "aws_key_pair" "example" {
  key_name   = "pkarisa1"
  public_key = var.public_key  # Update the key in the.tfvars file
}

resource "aws_instance" "example" {
  ami           = "ami-016b30666f212275a"  # Change this to your desired AMI ID
  instance_type = "t3.micro"  # Change this to your desired instance type

  key_name      = aws_key_pair.example.key_name

  vpc_security_group_ids = ["sg-0b2dc52942d22c3ed"] # Change this to your desired group ID. Default to allow ssh

  tags = {
    Name = "Ansible-Host-3"
  }

  provisioner "local-exec" {
    command = <<-EOT
        echo "docker_host_3 ansible_host=${aws_instance.example.public_dns}" >> /etc/ansible/hosts
    EOT
  }

  lifecycle {
    ignore_changes = [
      key_name,
    ]
  }

}