require 'test_helper'

class CustomerusersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customerusers_new_url
    assert_response :success
  end

end
