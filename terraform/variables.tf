variable "app_version" {
	type = string
	description = "Go Application docker images version label"
	default = "v1.0.0"
}

variable "host_port" {
	type = number
	description = "The port numer exposed on the host"
	default = 8080
}
