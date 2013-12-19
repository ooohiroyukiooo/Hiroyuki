class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :login_name
      t.string :password_digest
      t.datetime :deleted_at
    end
  end
end
