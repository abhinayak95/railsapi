class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone_num
      t.timestamps null: false
    end
  end
end
