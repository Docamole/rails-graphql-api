require 'rails_helper'
require_relative 'test_adapter'
require_relative 'test_server'


class TestConnection
  attr_reader :identifiers, :logger, :current_user, :server, :transmissions

  delegate :pubsub, to: :server

  def initialize(user, coder: ActiveSupport::JSON,
                 subscription_adapter: SuccessAdapter)
    @coder = coder
    @current_user = user
    @identifiers = [ :current_user ]

    @logger = ActiveSupport::TaggedLogging.new ActiveSupport::Logger.new(StringIO.new)
    # @server = TestServer.new(subscription_adapter: subscription_adapter)
    @server = ActionCable.server
    @transmissions = []
  end

  def transmit(cable_message)
    @transmissions << encode(cable_message)
  end

  def last_transmission
    decode @transmissions.last if @transmissions.any?
  end

  def decode(websocket_message)
    @coder.decode websocket_message
  end

  def encode(cable_message)
    @coder.encode cable_message
  end
end
