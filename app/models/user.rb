class User < ApplicationRecord
  validates :user_name, presence: true,
                   length: { minimum: 4 }

end
