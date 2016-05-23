class CreateEmailAuthenticationUserSessions < ActiveRecord::Migration
  def change
    create_table :email_authentication_user_sessions do |t|
      t.string :email
      t.string :login_token
      t.string :login_token_valid_until

      t.timestamps
    end
  end
end
