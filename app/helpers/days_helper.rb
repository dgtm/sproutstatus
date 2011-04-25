module DaysHelper
  def formatted_day(time)
    time.localtime.strftime(" %a, %B %d")
  end

  def day_text (time)
    @day_now = time.to_date
    @ago = (Date.today - @day_now).to_i
    if (@day_now == Date.today)
      @day = "Today"
    elsif (@day_now == Date.today - 1.day)
      @day = "Yesterday"
    elsif (@day_now == Date.today + 1.day)
      @day = "Tomorrow"
      elsif (@day_now == Date.today + 2.day)
        @day = "Day after Tomorrow"
    else
      @day = "#{@ago} days ago"
    end
    return @day
  end

  def formatted_time(time)
    time.localtime.strftime("%I:%M%p")
  end
end
