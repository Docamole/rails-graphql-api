require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  it 'should return Hello World!' do
    result = RailsGraphqlApiSchema.execute("{ testField }").to_h['data']['testField']
    expect(result).to eq('Hello World!')
  end
end
