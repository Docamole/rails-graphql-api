class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    @subscription_ids = []
    stream_from '__anycable__'
  end

  def execute(data)
    query = data['query']
    context = { channel: self }

    result = ApiSchema.execute({
      query: query,
      context: context
    })

    payload = {
      result: result.subscription? ? nil : result.to_h,
      more: result.subscription?
    }

    transmit(payload)
  end

  def unsubscribed
    @subscription_ids.each { |sid|
      ApiSchema.subscriptions.delete_subscription(sid)
    }
  end
end
