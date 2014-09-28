require 'spec_helper'

RSpec.describe Client do
  let(:socket_double) { double('Socket') }
  let(:addrinfo_double) { double('Addrinfo') }
  let(:client) { Client.new(socket_double, addrinfo_double) }

  describe '#start' do
    it 'welcome the client' do
      expect(socket_double).to receive(:put).with('Welcome!')
      client.start
    end
  end
end
