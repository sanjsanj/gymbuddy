class AddFitnessBioToUser < ActiveRecord::Migration
  def change
    add_column :users, :fitness_bio, :string
  end
end
