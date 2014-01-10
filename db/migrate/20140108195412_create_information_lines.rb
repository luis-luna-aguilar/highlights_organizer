class CreateInformationLines < ActiveRecord::Migration
  def change
    create_table :information_lines do |t|
      t.text :text
      t.references :topic

      t.timestamps
    end
  end
end
