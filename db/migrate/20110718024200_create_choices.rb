class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
