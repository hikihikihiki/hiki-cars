class AddBodyToMycars < ActiveRecord::Migration[5.2]
  def change
    add_column :mycars, :body, :string
  end
end
