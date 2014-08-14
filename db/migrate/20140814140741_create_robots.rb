class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :status
      t.references :world, index: true

      t.timestamps
    end
  end
end
