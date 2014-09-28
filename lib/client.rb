class Client
  attr_accessor :server, :socket, :addrinfo

  def initialize(server, socket, addrinfo)
    self.server = server
    self.socket = socket
    self.addrinfo = addrinfo
  end

  def connect
    server.output("Client connected: #{self.inspect}")
    output("Welcome to server #{server.inspect}")
  end

  def output(string)
    socket.puts(string)
  end
end
