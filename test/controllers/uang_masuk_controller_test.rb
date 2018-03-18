require 'test_helper'

class UangMasukControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get uang_masuk_index_url
    assert_response :success
  end

end
