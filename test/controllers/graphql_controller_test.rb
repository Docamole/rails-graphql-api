require 'test_helper'

class GraphqlControllerTest < ActionDispatch::IntegrationTest
  test 'should return Hello World!' do
    assert_equal 'Hello World!', query('testField')['testField']
  end
end
