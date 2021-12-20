require "test_helper"

class LeadsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get leads_destroy_url
    assert_response :success
  end
end
