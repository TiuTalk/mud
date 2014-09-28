require 'spec_helper'

RSpec.describe Client do
  let(:server_double) { double('Server', output: true) }
  let(:socket_double) { double('Socket', puts: true) }
  let(:addrinfo_double) { double('Addrinfo') }
  let(:client) { Client.new(server_double, socket_double, addrinfo_double) }

  describe '#connect' do
    it 'notify the server' do
      expect(server_double).to receive(:output).with(/Client connected/)
      client.connect
    end

    it 'welcome the client' do
      expect(client).to receive(:output).with(/Welcome/)
      client.connect
    end
  end

  describe '#output' do
    it 'send the message to the socket' do
      expect(socket_double).to receive(:puts).with(/Welcome/)
      client.output('Welcome, bro!')
    end
  end
end
