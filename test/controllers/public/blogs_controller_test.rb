require 'test_helper'

class Public::BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_blogs_index_url
    assert_response :success
  end

end
