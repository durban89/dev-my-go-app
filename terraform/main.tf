resource "docker_image" "go_app" {
	name = "my-go-app:${var.app_version}"
	keep_locally = true
}

resource "docker_network" "private_network" {
	name = "go_app_network"
}

resource "docker_container" "go_app_server" {
	name = "enterprise-go-app-service"
	image = docker_image.go_app.image_id

	networks_advanced {
		name = docker_network.private_network.name
	}

	ports {
		internal = 8080
		external = var.host_port
	}

	cpu_shares = 512
	memory = 128
}
