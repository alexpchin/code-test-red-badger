class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.string :name
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
