class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def to_param
    # override the use of default param
    self.class.column_names.include?("slug") ? slug : super
  end
end
