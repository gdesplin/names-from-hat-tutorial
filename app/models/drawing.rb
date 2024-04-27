class Drawing < ApplicationRecord
  belongs_to :hat
  has_many :names, through: :hat
  has_many :name_matches, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :hat_id }

  after_create :draw_and_save_matches
  
  def draw_and_save_matches
    if names.size < 3
      errors.add(:base, "Hat must have at least 3 names")
      return
    end

    shuffle_and_match_names(names.pluck(:id)).each(&:save)
  end

  def shuffle_and_match_names(name_ids_array)
    return [] if name_ids_array.blank?

    shuffled_name_matches = []
    shuffled_ids_array = name_ids_array.shuffle
    shuffled_ids_array.each_with_index do |current_giver_id, i|
      next_receiver_id = unless i == shuffled_ids_array.length - 1
                           shuffled_ids_array[i+1] 
                         else
                           shuffled_ids_array[0]
                         end
      shuffled_name_matches.push(name_matches.new(giver_id: current_giver_id,
                                                  receiver_id: next_receiver_id))
    end
    shuffled_name_matches
  end
end
