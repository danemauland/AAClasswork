require_relative "employee.rb"
class Manager < Employee

    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def add_employee(employee)
        @employees << employee
    end

    def bonus(multiplier)
        bonus = get_subordinates_salaries.sum * multiplier
    end
    private
    attr_reader :employees
    protected
    attr_reader :salary
    def get_subordinates
        all_subordinates = []
        @employees.each {|employee| all_subordinates += (employee.is_a?(Manager) ? [employee] + employee.get_subordinates : [employee])}
        all_subordinates
    end

    def get_subordinates_salaries
        get_subordinates.map {|employee| employee.salary}
    end
end

