class TopPagesController < ApplicationController
  def index
    @lastest_posts = Post.all.order(created_at: :ASC).limit(10)
    @top_rank_posts = Post.all.limit(5).sort_by {|i| -value(i)}
  end
end
