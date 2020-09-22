class Employee
attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
        set_manager if boss
    end

    def bonus(multiplier)
        @bonus = salary * multiplier
    end

    def set_manager
        boss.add_employee(self)
    end

    def inspect
        @name
    end
end