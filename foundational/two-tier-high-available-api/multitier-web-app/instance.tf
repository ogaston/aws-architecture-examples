resource "aws_key_pair" "key-pair" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu-ami.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key-pair.key_name
  tags = {
    Name = "my-server"
  }


  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }

  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
}

