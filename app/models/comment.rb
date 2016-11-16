class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true

  scope :pcomments, -> post_id do
    where("target_type = (?) AND target_id = (?)", Post.name, post_id)
  end

  scope :ccomments, -> comment_id do 
    where("target_type = (?) AND target_id = (?)", Comment.name, comment_id)
  end

  def post
    target_type == Post.name ? target : nil
  end

  def comments
    Comment.ccomments self.id
  end
end
