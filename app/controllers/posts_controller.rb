class PostsController < ApplicationController
  def index
    @q = Post.search(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @user = AdminUser.all
    @new_comment = Comment.new(post: @post)
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @category = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post Criado"
    else
        render "new"
    end

  end

  def edit
    @post = Post.find(params[:id])
    @category = Category.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_path, notice: "Post Atualizado"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path , notice: "Post deletado"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :author_id)
  end

end
