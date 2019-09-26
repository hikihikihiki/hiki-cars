class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments,:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :content

      t.timestamps
    end
  end
end
