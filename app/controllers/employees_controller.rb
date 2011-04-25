class EmployeesController < ApplicationController

def index
  @employees = Employee.all
end

def new
  @employee = Employee.find(params[:id])
end

def create
  @employee = Employee.find(params[:id])
end

def show
  @employee = Employee.find(params[:id])
  @leaves = @employee.leaves.all
end

end