class Holiday < ActiveRecord::Base
  has_event_calendar

validates :start_at, :presence => true
validates :end_at, :presence => true
before_create :check_end_date

def check_end_date
  self.start_at <= self.end_at
end

  def self.is_holiday( today )
     @holidays = Holiday.where('start_at <= ? AND end_at >= ?',Time.now, Time.now)
      if @holidays.length == 0
          return false
          else
          return true
      end
  end

  def self.holiday_message( today )

  # In case two or more holidays co-exist on the same day, sort by the created_at field and take the first element's status
  # This makes sure the latest created holiday's status is the one that is shown'
     @holidays = Holiday.where('start_at <= ? AND end_at >= ?',Time.now, Time.now)
     @holidays.order('created_at DESC').first.name

   end
end
