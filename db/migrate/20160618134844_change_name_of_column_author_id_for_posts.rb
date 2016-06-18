class ChangeNameOfColumnAuthorIdForPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :author_id, :admin_user_id
  end
end
