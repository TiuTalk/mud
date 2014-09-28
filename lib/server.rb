class Server
  def initialize(host = nil, port = nil)
    @host = host || '0.0.0.0'
    @port = port || 4000
  end

  def start
    puts "Starting MUD server on #{@host}, port #{@port}"
    Socket.tcp_server_loop(@host, @port) do |socket, client_addrinfo|
      handle_client_connection(socket, client_addrinfo)
    end
  end

  private

  def handle_client_connection(socket, client_addrinfo)
    puts "Client connected: #{client_addrinfo.ip_address}"

    client = Client.new(socket, client_addrinfo)
    cilent.start
  end
end
