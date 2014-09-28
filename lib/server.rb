class Server
  attr_accessor :host, :port

  def initialize(host = nil, port = nil)
    self.host = host || '0.0.0.0'
    self.port = port || 4000
  end

  def start
    output("Starting MUD server on #{host}, port #{port}")
    Socket.tcp_server_loop(host, port) do |socket, client_addrinfo|
      handle_client_connection(socket, client_addrinfo)
    end
  end

  def output(string)
    puts(string)
  end

  private

  def handle_client_connection(socket, client_addrinfo)
    Thread.new do
      client = Client.new(self, socket, client_addrinfo)
      client.connect
    end
  end
end
