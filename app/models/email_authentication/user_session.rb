module EmailAuthentication
  class UserSession < ActiveRecord::Base

    validates :email, presence: true, email: true

  end
end
