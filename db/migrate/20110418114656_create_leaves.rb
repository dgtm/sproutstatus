class CreateLeaves < ActiveRecord::Migration
  def self.up
    create_table :leaves do |t|
      t.date :start_date
      t.date :end_date
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :leaves
  end
end
