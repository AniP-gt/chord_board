require "test_helper"

class ChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chords_index_url
    assert_response :success
  end

  test "should get show" do
    get chords_show_url
    assert_response :success
  end

  test "should get new" do
    get chords_new_url
    assert_response :success
  end

  test "should get edit" do
    get chords_edit_url
    assert_response :success
  end
end
