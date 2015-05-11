class ChangeDayFormatInPostsTable < ActiveRecord::Migration
  def change
    remove_column :posts, :day
    add_column :posts, :day, :date
  end
end
