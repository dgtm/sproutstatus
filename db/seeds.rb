# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

[
  { :name => "Ranendra" },
  { :name => "Jayandra" },
  { :name => "Dipil" },
  { :name => "Abhay" },
  { :name => "Prasvin" }
  ].each do |attribute|
    Employee.find_or_create_by_name(attribute)
  end
  
  [
  {:name => "Holi", :start_at => DateTime.now + 1.day, :end_at => DateTime.now + 2.days, :all_day => false},
  {:name => "Trip Again", :start_at => DateTime.now + 5.days, :end_at => DateTime.now + 8.days, :all_day => false},
  {:name => "Sprout Day", :start_at => DateTime.now + 10.days, :end_at => DateTime.now + 10.days, :all_day => true}
 
  ].each do |attribute|
    Holiday.find_or_create_by_name(attribute)
  end
