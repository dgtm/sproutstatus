class Holiday < ActiveRecord::Base
  has_event_calendar

validates :start_at, :presence => true
validates :end_at, :presence => true
before_create :check_end_date

def check_end_date
  self.start_at.to_time.utc.localtime("+05:45").to_date <= self.end_at.to_time.utc.localtime("+05:45").to_date
end


  def self.is_holiday( today )
     @holidays = Holiday.where('start_at <= ? AND end_at >= ?',today.to_datetime, today.to_datetime)
      if @holidays.length == 0
          return false
          else
          return true
      end
  end

  def self.holiday_message( today )
  # In case two or more holidays co-exist on the same day, sort by the created_at field and take the first element's status
  # This makes sure the latest created holiday's status is the one that is shown'
     @holidays = Holiday.where('start_at <= ? AND end_at >= ?',today.to_datetime, today.to_datetime)
     @holidays.order('created_at DESC').first.name
   end

   def self.create_holidays
        d = DateTime.now
        begin
        if (d.saturday?) || (d.sunday?)
                @holiday = Holiday.create(:start_at => d, :name => "Weekend", :all_day => true)
                @holiday.save
        end
        d = d + 1.day
        end while d <= (DateTime.now + 2.months)
   end
end
