class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :top_left
      t.string :top_middle
      t.string :top_right
      t.string :middle_left
      t.string :middle
      t.string :middle_right
      t.string :bottom_left
      t.string :bottom_middle
      t.string :bottom_right

      t.timestamps null: false
    end
  end
end
