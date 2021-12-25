class Badge < ApplicationRecord
  has_many :users_badge, dependent: :destroy
  has_many :users, through: :users_badge, dependent: :destroy 
end
