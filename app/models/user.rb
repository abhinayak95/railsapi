class User < ApplicationRecord
  validates :phone_num, length: { is: 10 }
end
