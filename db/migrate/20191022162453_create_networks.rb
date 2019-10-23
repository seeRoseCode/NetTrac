class CreateNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|
      t.belongs_to :user

      t.timestamps
    end
  end
end
