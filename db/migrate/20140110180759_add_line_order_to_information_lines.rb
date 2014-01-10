class AddLineOrderToInformationLines < ActiveRecord::Migration
  def change
    add_column :information_lines, :line_order, :integer
  end
end
