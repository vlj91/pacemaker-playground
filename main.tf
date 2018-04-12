resource "digitalocean_ssh_key" "main" {
  name       = "controller.${var.domain}"
  public_key = "${file("${var.local_publickey_path}")}"
}

data "template_file" "userdata" {
  template = "${file("userdata.sh")}"

  vars {
    domain   = "${var.domain}"
    password = "${var.password}"
  }
}

resource "digitalocean_droplet" "controller" {
  image  = "${var.image}"
  name   = "controller${count.index + 1}.${var.domain}"
  region = "${var.region}"
  size   = "${var.droplet_size}"

  ssh_keys = [
    "${digitalocean_ssh_key.main.id}",
  ]

  user_data  = "${data.template_file.userdata.rendered}"
  monitoring = true
  count      = 3
}

resource "digitalocean_record" "controller" {
  domain = "${var.domain}"
  type   = "A"
  name   = "controller${count.index + 1}"
  value  = "${element(digitalocean_droplet.controller.*.ipv4_address,
count.index)}"

  count = 3
}
