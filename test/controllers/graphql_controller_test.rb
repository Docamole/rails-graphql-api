require 'test_helper'

class GraphqlControllerTest < ActionDispatch::IntegrationTest
  test 'should return Hello World!' do
    query_string = '{ testField }'
    result_hash = RailsGraphqlApiSchema.execute(query_string).to_h
    assert_equal 'Hello World!', result_hash['data']['testField']
  end
end
