class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true

  scope :pcomments, -> post_id do
    where("target_type = (?) AND target_id = (?)", Post.name, post_id)
  end

  def post
    target_type == Post.name ? target : nil
  end
end
