class Hat < ApplicationRecord
  has_many :drawings, dependent: :destroy
  has_many :names, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end

