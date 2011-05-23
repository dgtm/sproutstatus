# Created for rufus-scheduler
require 'rubygems'
require 'rufus/scheduler'

## to start scheduler
scheduler = Rufus::Scheduler.start_new

# This scheduler runs every month
scheduler.cron('0 0 1 * *') do      # 00:00 First day of every month
  d = Time.now.utc.localtime("+05:45").to_date
  today = Time.now.utc.localtime("+05:45").to_date
    begin
      if (d.saturday?)
          @holiday = Holiday.create(:start_at => d, :end_at => d + 1.day, :name => "Weekend")
          @holiday.save
        end
          d = d + 1.day
    end while d < (today + 1.month)
  puts "Holiday on sat and sun"
end