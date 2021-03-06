class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.datetime :date_responded
      t.boolean :attending
      t.string :first_name
      t.string :last_name
      t.string :role
      t.integer :guests
      t.text :allergies
      t.integer :website_id
      t.timestamps
    end
  end
end
