class AddParentToCategory < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.integer :parent_id
    end
  end

  def self.down
    change_table :categories do |t|
      t.remove :parent_id
    end
  end
end
