class CommentsController < InheritedResources::Base

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = "Comentário adicionado com sucesso"    
    else
      flash[:notice] = "Erro ao adicionar comentário"
    end
    redirect_to @comment.post
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :email, :body, :post_id)
    end
end
