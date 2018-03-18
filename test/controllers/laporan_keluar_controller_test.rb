require 'test_helper'

class LaporanKeluarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get laporan_keluar_index_url
    assert_response :success
  end

end
