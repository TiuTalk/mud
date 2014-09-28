require 'spec_helper'

RSpec.describe Server do
  let(:server) { Server.new('0.0.0.0', '5000') }

  describe '.start' do
    before do
      @server = Thread.new do
        server.start
      end

      sleep(0.1) # Wait the server to load
    end

    after do
      @server.exit
    end

    let(:socket) { TCPSocket.new('0.0.0.0', '5000') }

    it 'accept connections' do
      expect(socket).to_not be_closed
    end
  end
end
