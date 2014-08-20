class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :orientation
      t.integer :x
      t.integer :y
      t.references :robot, index: true
      t.integer :status

      t.timestamps
    end
  end
end
