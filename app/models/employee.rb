class Employee < ActiveRecord::Base
  has_many :leaves
  
  def self.search( name )
    if name
      find(:all, :conditions => ['name LIKE ?', "%#{name}%"])
    else
      find(:all)
    end
  end
  
end
