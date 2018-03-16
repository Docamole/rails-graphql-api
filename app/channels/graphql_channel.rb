class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    stream_from "__anycable__"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
