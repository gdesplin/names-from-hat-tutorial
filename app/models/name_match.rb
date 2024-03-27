class NameMatch < ApplicationRecord
  belongs_to :drawing
  belongs_to :giver, class_name: "Name"
  belongs_to :receiver, class_name: "Name"

  validates :giver_id, :receiver_id, uniqueness: { scope: :drawing_id }
end
