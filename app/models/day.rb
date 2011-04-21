class Day < ActiveRecord::Base

 def all_statuses
  return ["Open", "Closed", "On a Break"]
 end

 def self.is_more_than_one_day( day )
  if (Time.now.utc.localtime("+05:45").to_date - day ) > 1
    return true
  else
    return false
  end
 end

end
