class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def print_pretty_errors
    errors.messages.values.flatten.to_sentence
  end

end
