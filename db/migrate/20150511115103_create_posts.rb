class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :activity
      t.text :location
      t.text :time
      t.text :day

      t.timestamps null: false
    end
  end
end
