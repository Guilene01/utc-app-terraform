resource "aws_instance" "server" {
  instance_type               = "t2.micro"
  ami                         = "ami-0166fe664262f664c"
  key_name                    = aws_key_pair.key.key_name
  security_groups             = [aws_security_group.sg-utc.id]
  subnet_id                   = aws_subnet.pub1.id
  associate_public_ip_address = true # Enable public IP
  user_data                   = file("setup.sh")
  tags = {
    Name : "utc_dev_inst"
    Team : "cloud_transformation"
    env : "dev"
    Author : "Guilene"
  }
}
#create ebs volume

resource "aws_ebs_volume" "vol" {
  availability_zone = aws_instance.server.availability_zone
  size              = 20
  tags = {
    Name = "utc-volume"

  }
}
#attach volume 
resource "aws_volume_attachment" "name" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.vol.id
  instance_id = aws_instance.server.id
}
