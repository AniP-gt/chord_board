require "test_helper"

class ChordControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chord_index_url
    assert_response :success
  end

  test "should get list" do
    get chord_list_url
    assert_response :success
  end
end
