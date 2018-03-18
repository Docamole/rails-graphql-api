module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connected
      reject_unauthorized_connection unless current_user
    end
  end
end
