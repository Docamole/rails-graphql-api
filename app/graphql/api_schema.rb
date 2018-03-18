ApiSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Subscriptions::ActionCableSubscriptions
end
