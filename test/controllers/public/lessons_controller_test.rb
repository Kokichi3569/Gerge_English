require 'test_helper'

class Public::LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_lessons_index_url
    assert_response :success
  end

  test "should get show" do
    get public_lessons_show_url
    assert_response :success
  end

end
