class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :last_name
      t.string :first_name
      t.string :second_name
      t.string :email, index: true
      t.string :password_digest
      t.attachment :avatar
      t.integer :role

      t.timestamps
    end
  end
end
