class EmployeesController < ApplicationController

def index
  @employees = Employee.all
end

def new
  @employee = Employee.find(params[:id])
  @absentee = @employee.absentees.new
end

def create
  @employee = Employee.find(params[:id])
  @absentee = @employee.absentees.create(params[:absentee])

end

def show
  @employee = Employee.find(params[:id])
  @leaves = @employee.leaves.all
end

end