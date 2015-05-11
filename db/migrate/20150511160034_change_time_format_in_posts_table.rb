class ChangeTimeFormatInPostsTable < ActiveRecord::Migration
  def change
    remove_column :posts, :time
    add_column :posts, :time, :time
  end
end
