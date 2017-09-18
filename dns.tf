provider "dnssimple" {
  token   = "abcd1234"
  account = "nope"
}

resource "dnsimple_record" "www" {
  domain = "terraform.rocks"
  type   = "A"
  name   = "..."
  value  = "${aws_instance.web.0.public_ip}"
}
