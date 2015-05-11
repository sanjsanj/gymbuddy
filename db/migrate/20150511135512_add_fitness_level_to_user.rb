class AddFitnessLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :fitness_level, :integer
  end
end
