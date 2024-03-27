class Drawing < ApplicationRecord
  belongs_to :hat
  has_many :name_matches, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :hat_id }
end
