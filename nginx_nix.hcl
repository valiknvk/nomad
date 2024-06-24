job "html_site" {

  group "site" {
    network {
      mode = "host"
      port "http" { 
	static = 81
        to     = 81
      }
    }
  
    task "nginx" {
      driver = "docker"
      config {
	network_mode = "host"
        image = "nginx:nix"

        ports = ["http"]
      }
    }
  }
}
