class AddDescriptionToHoliday < ActiveRecord::Migration
  def self.up
    add_column :holidays, :description, :text
  end

  def self.down
    remove_column :holidays, :description
  end
end
