require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]
      source_options.model_class.new((DBConnection.execute(<<-SQL, self.id)
        SELECT
          #{source_options.table_name}.*
        FROM
          #{self.class.table_name}
        JOIN
          #{source_options.table_name} ON #{self.class.table_name}.#{through_options.foreign_key} = #{source_options.table_name}.#{source_options.primary_key}
        WHERE
          #{self.class.table_name}.#{through_options.primary_key} = ?
      SQL
      ).first)
    end
  end
end
