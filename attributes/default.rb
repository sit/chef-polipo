# default[:polipo][:proxy_address] = "::0" # IPv4 and IPv6
default[:polipo][:proxy_address]   = "0.0.0.0" # IPv4 only
default[:polipo][:allowed_clients] = ["127.0.0.1", "192.168.50.0/24"]
default[:polipo][:log_level]       = "0xFF"
