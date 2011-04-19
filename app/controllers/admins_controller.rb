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
      redirect_to admins_path, :notice => "An admin message was created"
    end
end

end