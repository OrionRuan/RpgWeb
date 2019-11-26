class UserHistorium < ApplicationRecord
  belongs_to :historia
  belongs_to :user
end
