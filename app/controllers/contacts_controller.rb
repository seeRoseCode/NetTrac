class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    @contacts.each{|c| ContactSerializer.new(c).serializable_hash}
  end

  def show
    this_contact
    render json: ContactSerializer.new(@contact).serializable_hash
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save ? render json: { user: UserSerializer.new(@contact)}, status: :created  : render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
  end

  def update
    this_contact
    @contact.update(contact_params) ? render json: @contact : render json: @contact.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    this_contact
    @contact.destroy
  end

  private

  def this_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:user).permit!
  end

end
