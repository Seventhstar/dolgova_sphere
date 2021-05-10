class Course < ApplicationRecord
  def description_html
    ActionController::Base.helpers.simple_format(self&.description)
  end
end
