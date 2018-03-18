require 'test_helper'

class UangKeluarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get uang_keluar_index_url
    assert_response :success
  end

end
