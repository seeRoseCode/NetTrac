class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :my_contacts


  def my_contacts
    self.object.contacts.collect{ |c| ContactSerializer.new(c).serializable_hash }
  end


end
