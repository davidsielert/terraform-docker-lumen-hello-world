

resource "docker_image" "php-nginx" {
  name         = "davidsielert-php-nginx"
  keep_locally = false
  build {
    context = "${path.module}/../"
  }
  triggers = {
    dir_sha1   = sha1(join("", [for f in fileset(path.module, "src/*") : filesha1(f)]))
    nginx_sha1 = sha1(file("${path.module}/../nginx/default.conf"))
  }
}
//optionally start the container
resource "docker_container" "nginx" {
  count = var.start_container ? 1 : 0
  image = docker_image.php-nginx.image_id
  name  = var.project_name
}

resource "docker_registry_image" "php-nginx" {
  count = var.push_image ? 1 : 0
  name = var.remote_registry
  pull_triggers = [docker_image.php-nginx.id]
}