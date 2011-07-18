class AddVotesCountToChoices < ActiveRecord::Migration
  def self.up
    add_column :choices, :votes_count, :integer, :default => 0
    
    Choice.reset_column_information  
    Choice.all.each do |c|  
      c.update_attribute :votes_count, c.votes.length  
    end
  end

  def self.down
    remove_column :choices, :votes_count
  end
end
