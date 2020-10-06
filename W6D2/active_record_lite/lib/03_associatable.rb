require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
   @class_name = options[:class_name] || name.to_s.camelcase
   @primary_key = options[:primary_key] || :id
  @foreign_key = options[:foreign_key] || (name.to_s + '_id').to_sym
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
  @class_name = options[:class_name] || name.to_s.camelcase.singularize
  @primary_key = options[:primary_key] || :id
  @foreign_key = options[:foreign_key] || (self_class_name.underscore + '_id').to_sym
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      f_key = self.send(options.foreign_key)
      p_key = options.primary_key
      options.model_class.where({p_key => f_key}).first
    end
    assoc_options[name] = options
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.name, options)
    define_method(name) do
      f_key = options.foreign_key
      p_key = self.send(options.primary_key)
      options.model_class.where({f_key => p_key})
    end
    assoc_options[name] = options
  end

  def assoc_options
    @assoc_opions ||= {}
  end
end

class SQLObject
  extend Associatable
end
