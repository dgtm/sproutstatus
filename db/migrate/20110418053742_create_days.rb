class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.date :date
      t.text :message
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end
