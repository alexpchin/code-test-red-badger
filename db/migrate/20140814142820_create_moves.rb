class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :orientation
      t.integer :xcoordinate
      t.integer :xcoordinate
      t.references :robot, index: true

      t.timestamps
    end
  end
end
