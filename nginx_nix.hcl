job "html_site" {

  group "site" {
    network {
      mode = "bridge"
      port "http" { 
	static = 8080
        to     = 80
      }
    }
  
    task "nginx" {
      driver = "docker"
      config {
	#network_mode = "host"
        image = "nginx:nix"

        ports = ["http"]
      }
    }
  }
}
