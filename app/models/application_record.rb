# frozen_string_literal: true

# Base class for models within the application, inherits from ActiveRecord::Base
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
