require 'test_helper'

class MycarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mycars_index_url
    assert_response :success
  end

  test "should get search" do
    get mycars_search_url
    assert_response :success
  end

end
