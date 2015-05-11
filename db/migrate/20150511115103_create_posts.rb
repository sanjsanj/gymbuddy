class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :activity
      t.text :location
      t.time :time
      t.date :day

      t.timestamps null: false
    end
  end
end
