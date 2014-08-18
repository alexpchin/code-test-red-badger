class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :orientation
      t.integer :xcoordinate
      t.integer :xcoordinate
      t.references :robot, index: true
      t.references :world, index: true
      t.string :status

      t.timestamps
    end
  end
end
