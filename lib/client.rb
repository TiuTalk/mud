class Client
  def initialize(socket, client_addrinfo)
    @socket = socket
    @client_addrinfo = client_addrinfo
  end

  def start
    output('Welcome!')
  end

  def output(string)
    @socket.put(string)
  end
end
