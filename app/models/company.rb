class Company < ApplicationRecord
  has_many :rfid_containers, dependent: :nullify
end
