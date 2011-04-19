class Day < ActiveRecord::Base

 def all_statuses
  return ["Open", "Closed", "On a Break"]
 end

 def self.is_more_than_one_day( day )
  if (Date.today - day ) > 1
    return true
  else
    return false
  end
 end

end
