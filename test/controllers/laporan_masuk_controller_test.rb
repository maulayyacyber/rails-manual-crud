require 'test_helper'

class LaporanMasukControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get laporan_masuk_index_url
    assert_response :success
  end

end
