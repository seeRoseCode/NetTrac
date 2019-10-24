class User < ApplicationRecord
  has_one :network
  has_many :contacts, through: :network , dependent: :destroy

  def add_network
  end

end
