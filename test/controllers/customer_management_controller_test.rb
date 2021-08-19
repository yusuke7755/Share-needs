require 'test_helper'

class CustomerManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_management_new_url
    assert_response :success
  end

  test "should get index" do
    get customer_management_index_url
    assert_response :success
  end

  test "should get edit" do
    get customer_management_edit_url
    assert_response :success
  end

end
