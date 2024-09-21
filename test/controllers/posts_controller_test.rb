require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "【Rails実践課題①】スケジュール管理アプリ"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get index" do
    get posts_index_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get posts_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
