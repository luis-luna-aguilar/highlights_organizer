class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.integer :start
      t.integer :end
      t.references :information_line

      t.timestamps
    end
  end
end
