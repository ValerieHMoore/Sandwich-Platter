class CreateSandwiches < ActiveRecord::Migration[4.2]
  def change
    create_table :sandwiches do |t|
      t.string :sandwich_name
      t.string :ingredients
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
