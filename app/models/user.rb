class User < ApplicationRecord
  has_one :network
  has_many :contacts, through: :network , dependent: :destroy

  def add_network
    Network.create(user_id: self.id)
  end



end
