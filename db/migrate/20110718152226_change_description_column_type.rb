class ChangeDescriptionColumnType < ActiveRecord::Migration
  def self.up
    change_column :choices, :description, :text
    change_column :choices, :title, :text
  end

  def self.down
    change_column :choices, :description, :string
    change_column :choices, :title, :string
  end
end
