class AdminsController < ApplicationController


def clear
    if Admin.destroy_all
      redirect_to admins_path, :notice => "Admin messages were cleared"
    else
      redirect_to admins_path, :notice => "Deletion failed"
    end
end

def new
  @admin_status = Admin.new
end

def create
    @admin_status = Admin.create(:message => params[:content], :status => params[:status])
    if @admin_status.save
      redirect_to new_admins_path, :notice => "An admin message was created"
    else
    redirect_to admins_path, :alert => "Admin message could not be created"
    end
end
def index
  @holiday = Holiday.new
  #Required for calendar
  @month = (params[:month] || (Time.zone || Time).now.month).to_i
  @year = (params[:year] || (Time.zone || Time).now.year).to_i
  @shown_month = Date.civil(@year, @month)
  @event_strips = Holiday.event_strips_for_month(@shown_month)
end

end