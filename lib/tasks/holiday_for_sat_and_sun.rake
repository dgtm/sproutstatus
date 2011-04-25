namespace :holiday do
  desc "Allocate Holidays for Saturday and Sunday"
  task :create_holidays => :environment do
    d = Time.now.utc.localtime("+05:45").to_datetime
    puts d
      begin
        if (d.saturday?) || (d.sunday?)
          puts d.day
            @holiday = Holiday.create(:start_at => d.to_date, :end_at => d.to_date, :name => "Weekend", :all_day => true)
            @holiday.save
          end
          d = d + 1.day
        end while d < (Time.now.utc.localtime("+05:45").to_datetime + 1.year)
  end
end