class RenameauthorIdToUserIdLikes < ActiveRecord::Migration[7.0]
  def up
    rename_column :likes, :author_id, :user_id
  end

  def down
    rename_column :likes, :user_id, :author_id
  end
end
