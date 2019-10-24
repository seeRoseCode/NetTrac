class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :business, :phone_number, :email_address, :linked_in, :twitter, :website

  
end
