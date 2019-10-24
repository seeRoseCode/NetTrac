class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title, optional: true
      t.string :business, optional: true
      t.integer :phone_number, optional: true
      t.string :email_address, optional: true
      t.string :linked_in, optional: true
      t.string :twitter, optional: true
      t.string :website, optional: true
      t.belongs_to :network

      t.timestamps
    end
  end
end
