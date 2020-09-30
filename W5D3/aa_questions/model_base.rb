require 'active_support/inflector'
class ModelBase
    def self.find_by_id(id)
        return_val = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            #{table_name}
        WHERE
            id = ?
        SQL
        self.new(return_val.first)
    end

    def self.all
        arr = QuestionsDatabase.instance.execute(<<-SQL)
        SELECT
            *
        FROM
            #{table_name}
        SQL
        arr.map {|ele| self.new(ele)}
    end

    def save
        var_names = self.instance_variables
        hash = Hash.new
        var_names.each {|var| hash[var] = self.instance_variable_get(var)}
        hash.delete_key(:@id)
        raise "entry already exists" unless @id.nil?
        QuestionsDatabase.instance.execute(<<-SQL, hash)
        INSERT INTO #{table_name} (#{hash.keys})
        VALUES (#{question_marks})
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end
end