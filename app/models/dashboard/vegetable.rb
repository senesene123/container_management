module Dashboard
  # rubocop:disable Rails/InverseOf
  class Vegetable < ApplicationRecord
    has_many :rfid_containers, foreign_key: :contents, dependent: :restrict_with_error
    validates :vegetable_id, length: { minimum: 1 }, uniqueness: true
    validates :vegetable_name, length: { minimum: 1 }
  end
  # rubocop:enable Rails/InverseOf
end
