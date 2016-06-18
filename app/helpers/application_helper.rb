module ApplicationHelper

  def all_categories
    @categories = Category.all
  end

  def all_posts
    @posts = Post.all
  end
end
