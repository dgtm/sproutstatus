module DaysHelper

def isHoliday( today )
   @holidays = Holiday.where('start_at <= ? AND end_at >= ?',Date.today, Date.today)
    if @holidays.length == 0
        return false
        else 
        return true
    end
end

def holiday_message( today )

# In case two or more holidays co-exist on the same day, sort by the created_at field and take the first element's status
# This makes sure the latest created holiday's status is the one that is shown'
   @holidays = Holiday.where('start_at <= ? AND end_at >= ?',Date.today, Date.today)
   h.order('created_at DESC').first.name
   
 end
end
