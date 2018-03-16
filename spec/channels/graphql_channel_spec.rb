require 'rails_helper'

RSpec.describe GraphqlChannel, type: :channel do
  # before do
  #   stub_connection
  # end

  it 'broadcasts' do
    expect(GraphqlChannel.broadcast_to('__anycable__', query: '{ testField }')).to eq(1)
  end

  # it 'subscribes to a stream' do
  #   subscribe
  #   pending('working on channels/subscriptions (might be testing suite too?)')
  #   expect(subscription).to be_confirmed
  # end
end
