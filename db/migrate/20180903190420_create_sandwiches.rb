class CreateSandwiches < ActiveRecord::Migration
  def change
    create_table :sandwiches do |t|
      t.string :sandwich_name
      t.string :ingredients
      t.timestamps null: false
    end
  end
end
