class Name < ApplicationRecord
  belongs_to :hat
  has_one :receiving_name_match, class_name: "NameMatch", foreign_key: "receiver_id"
  has_one :giving_name_match, class_name: "NameMatch", foreign_key: "giver_id"
  has_one :giving_to, through: :giving_name_match, source: :receiver
  has_one :receiving_from, through: :receiving_name_match, source: :giver

  validates :name, presence: true
  validates :name, uniqueness: { scope: :hat_id }
end
