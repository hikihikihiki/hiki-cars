class ChangeDataLiveinToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :livein, :integer
  end
end
