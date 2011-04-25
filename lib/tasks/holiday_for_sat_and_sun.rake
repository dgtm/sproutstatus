namespace :holiday do
  desc "Allocate Holidays for Saturday and Sunday"
  task :create_holidays => :environment do
    d = Time.now.utc.localtime("+05:45").to_datetime
    puts d
      begin
        if (d.saturday?)
          puts d.day
            @holiday = Holiday.create(:start_at => d.to_date, :end_at => d.to_date + 1.day, :name => "Weekend", :all_day => false)
            @holiday.save
          end
          d = d + 1.day
        end while d < (Time.now.utc.localtime("+05:45").to_datetime + 1.year)
  end
end