require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get crete" do
    get likes_crete_url
    assert_response :success
  end

  test "should get destroy" do
    get likes_destroy_url
    assert_response :success
  end

end
