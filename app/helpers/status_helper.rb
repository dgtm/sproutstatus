module StatusHelper
  def formatted_time(time)
     time.localtime.strftime(" %m/%d/%Y  at %I:%M%p")
   end
end
