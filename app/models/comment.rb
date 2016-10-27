class Comment < ApplicationRecord
  belongs_to :user

  scope :pcomments, -> post_id do
    where("target_type = (?) AND target_id = (?)", Post.name, post_id)
  end
end
