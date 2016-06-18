class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #helper_method :all_categories
  before_action :site_search
  def site_search

    @q = Post.search(params[:q])
    @search_result = @q.result(distinct: true)

  end

end
