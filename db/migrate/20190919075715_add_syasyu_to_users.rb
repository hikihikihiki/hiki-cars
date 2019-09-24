class AddSyasyuToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :syasyu, :string
  end
end
