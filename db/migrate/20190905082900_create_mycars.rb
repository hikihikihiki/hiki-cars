class CreateMycars < ActiveRecord::Migration[5.2]
  def change
    create_table :mycars,:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.string :type
      t.integer :maker_id

      t.timestamps
    end
  end
end
