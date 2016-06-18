class Post < ActiveRecord::Base
#attr_accessor :title, :body , :category_id, :author_id
belongs_to :category
belongs_to :admin_user
has_many :comments, dependent: :destroy 
end
