require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  it 'should respond to a query' do
    params = { query: '{ testField }' }
    get 'execute', params: params
    result = JSON.parse(response.body)['data']['testField']
    expect(result).to eq('Hello World!')
  end

  it 'should respond to a mutation' do
    params = { query: 'mutation HelloWorld { testField }' }
    post 'execute', params: params
    result = JSON.parse(response.body)['data']['testField']
    expect(result).to eq('Hello World!')
  end

  it 'should accept a string of variables' do
    params = {
      variables: '{}',
      query: '{ testField }'
    }
    post 'execute', params: params
    result = JSON.parse(response.body)['data']['testField']
    expect(result).to eq('Hello World!')
  end

  it 'should accept an empty string of variables' do
    params = {
      variables: '',
      query: '{ testField }'
    }
    post 'execute', params: params
    result = JSON.parse(response.body)['data']['testField']
    expect(result).to eq('Hello World!')
  end

  it 'should fail with ambiguous variables' do
    params = {
      variables: 42,
      query: '{ testField }'
    }
    expect{ post 'execute', params: params }.to raise_error(ArgumentError)
  end
end
