# test/models/comment_test.rb
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without content" do
    comment = Comment.new
    assert_not comment.save, "Saved the comment without content"
  end

  test "should save comment with content" do
    user = users(:one)  # Esto supone que tienes un fixture para usuarios
    comment = Comment.new(content: "This is a comment", user: user)
    assert comment.save, "Failed to save a valid comment"
  end
end
