resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.public[1].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  #security_groups             = [aws_security_group.allow_tls.name]
  key_name = "hipstershop"
  #user_data = file("bootstrap.sh")

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = "25"
  }


  tags = {
    Name = "Bootstrap-Server"
  }

  depends_on = [aws_eks_node_group.spot]
}