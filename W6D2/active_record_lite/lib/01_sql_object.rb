require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= (DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
      SQL
    ).first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        attributes[col]
      end
      define_method("#{col}=") do |arg|
        attributes[col] = arg
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    parse_all(DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
    )
  end

  def self.parse_all(results)
    results.map {|row| self.new(row)}
  end

  def self.find(id)
    parse_all(DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
      #{table_name}.id = ?
    SQL
    ).first
  end

  def initialize(params = {})
    params.each do |col, val|
      col_sym = col.to_sym
      raise "unknown attribute '#{col_sym}'" unless self.class.columns.include?(col_sym)
      self.send((col.to_s + '=').to_sym, val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |col|
      send(col)
    end
  end

  def insert
    col_names = self.class.columns.join(', ')
    question_marks = ['?'] * self.class.columns.length
    question_marks = question_marks.join(', ')
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    cols = self.class.columns.drop(1).map { |col| "#{col} = ?"}.join(', ')
    question_marks = ['?'] * self.class.columns.length
    question_marks = question_marks.join(', ')
    DBConnection.execute(<<-SQL, *(attribute_values.drop(1) << id))
      UPDATE
        #{self.class.table_name}
      SET
        #{cols}
      WHERE
        id = ?
    SQL
  end

  def save
    if id
      update
    else
      insert
    end
  end
end
