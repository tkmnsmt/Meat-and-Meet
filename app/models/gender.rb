class Gender < ApplicationRecord
  belongs_to :user, optional: true
end
