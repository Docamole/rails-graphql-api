require 'rails_helper'
require_relative 'stubs/test_connection'

RSpec.describe GraphqlChannel, type: :channel do
  subject(:channel) { described_class.new(connection, {}) }
  let(:connection) { TestConnection.new('test') }
  # let(:connection) { ApplicationCable::Connection.new(current_user: 'test', env: 'test') }
  let(:server) { connection.server }
  let(:data) do
    {
      action: 'execute',
      query: '{ testField }'
    }
  end

  it 'does something' do
    expect(server).to receive(:broadcast)
    # channel.perform_action(data)
    server.broadcast '__anycable__', 'puppies!'
  end

  it 'subscribes'
  it 'responds to a query'
  it 'responds to a mutation'
end
