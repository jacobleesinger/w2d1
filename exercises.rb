class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(salary)
    @salary = salary
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(employees, salary)
    @employees = employees
    @salary = salary
  end

  def bonus(multiplier)
    grand_total = @employees.inject(0) do |total, employee|
      total += employee.salary
    end
    grand_total * multiplier
  end
end
