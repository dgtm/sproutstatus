class LeavesController < ApplicationController

def new
  @employee = Employee.find(params[:employee_id])
  @leave = @employee.leaves.new
end

def create
  @employee = Employee.find(params[:employee_id])
  @leave = @employee.leaves.create(params[:leafe])
  if @leave.save
    redirect_to employees_path, :notice => "A leave was approved for #{@employee.name}"
  else
    render :action => 'new', :alert => "Leave Approval Failed"
  end
end

def index
  @leaves = Leafe.all
end
end