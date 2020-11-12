class Contact < ApplicationRecord
  with_options presence: true do
    validates :email
    validates :message
  end
end
