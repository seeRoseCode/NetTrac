class User < ApplicationRecord
  has_one :network
  has_many :contacts, through: :network 
end
