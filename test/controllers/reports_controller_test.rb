require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get proposals" do
    get reports_proposals_url
    assert_response :success
  end

  test "should get estimates" do
    get reports_estimates_url
    assert_response :success
  end

  test "should get invoices" do
    get reports_invoices_url
    assert_response :success
  end
end
