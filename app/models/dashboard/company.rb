module Dashboard
  # rubocop:disable Rails/InverseOf
  # rubocop:disable Layout/LineLength
  class Company < ApplicationRecord
    has_many :from_rfid_containers, class_name: 'RfidContainer', foreign_key: 'from_place', dependent: :restrict_with_error
    has_many :to_rfid_containers, class_name: 'RfidContainer', foreign_key: 'to_place', dependent: :restrict_with_error
    validates :company_id, length: { minimum: 1 }, uniqueness: true
    validates :company_name, length: { minimum: 1 }
  end
  # rubocop:enable Rails/InverseOf
  # rubocop:enable Layout/LineLength
end
