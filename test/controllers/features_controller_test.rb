require 'test_helper'

class FeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get features_new_url
    assert_response :success
  end

end
