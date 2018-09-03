class CreateSandwiches < ActiveRecord::Migration
  def change
    create_table :sandwiches do |t|

      t.timestamps null: false
    end
  end
end
