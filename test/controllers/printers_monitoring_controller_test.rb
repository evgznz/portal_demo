require 'test_helper'

class PrintersMonitoringControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get printers_monitoring_index_url
    assert_response :success
  end

  test "should get check" do
    get printers_monitoring_check_url
    assert_response :success
  end

end
