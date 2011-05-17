class EmployeesController < ApplicationController

def index
p @searched_employees
  @employees = @searched_employees || Employee.all
  p @employees
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

def search
    @searched_employees = Employee.search(params[:employee_name])
    p 'huhhAHAHhahaa'
    p @searched_employees
    redirect_to employees_path(@searched_employees), :remote => true
end

end
