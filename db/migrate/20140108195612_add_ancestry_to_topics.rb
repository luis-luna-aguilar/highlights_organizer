class AddAncestryToTopics < ActiveRecord::Migration
  def up
    add_column :topics, :ancestry, :string
    add_index :topics, :ancestry
  end

  def down
    remove_column :topics, :ancestry
    remove_index :topics, :ancestry
  end
end
