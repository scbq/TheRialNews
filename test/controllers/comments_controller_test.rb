require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @user = users(:one)  # Usa un fixture de usuarios si existe
    sign_in @user         # Inicia sesión con Devise
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { content: "New comment", user_id: @user.id } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { content: "Updated content" } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    sign_in users(:admin) # Asegúrate de que tienes un usuario autenticado con permisos
    assert_difference('Comment.count', -1) do
      delete comment_url(comments(:one))
    end
    assert_redirected_to comments_url
  end
  
end
