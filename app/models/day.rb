class Day < ActiveRecord::Base

 def all_statuses
  return ["Open", "Closed", "On a Break"]
 end
end
