require 'rails_helper'

RSpec.describe Drawing, type: :model do

  describe "#shuffle_and_match_names" do
    let(:drawing) { create(:drawing, hat: hat) }
    let(:name_1) { create(:name, hat: hat) }
    let(:name_2) { create(:name, hat: hat) }
    let(:name_3) { create(:name, hat: hat) }
    let(:hat) { create(:hat) }
    let(:name_ids_array) { [name_1.id, name_2.id, name_3.id] } 

    it "sorted returned giver_ids match sorted given array" do
      shuffled_giver_ids = drawing.shuffle_and_match_names(name_ids_array).pluck(:giver_id)
      expect(shuffled_giver_ids).to match_array(name_ids_array)
    end
    it "sorted returned recevier_ids match sorted given array" do
      shuffled_receiver_ids = drawing.shuffle_and_match_names(name_ids_array).pluck(:receiver_id)
      expect(shuffled_receiver_ids).to match_array(name_ids_array)
    end

    it "shuffles name matches differently with different random seeds" do
      srand(1)
      shuffled_1 = drawing.shuffle_and_match_names(name_ids_array).pluck(:reciever_id, :giver_id)
      srand(2)
      shuffled_2 = drawing.shuffle_and_match_names(name_ids_array).pluck(:reciever_id, :giver_id)
      expect(shuffled_1).not_to eq(shuffled_2)
    end

    it "returns NameMatch object" do
      shuffled_receiver_ids = drawing.shuffle_and_match_names(name_ids_array)
      expect(shuffled_receiver_ids.first).to be_a(NameMatch)
    end

    context "name_ids_array is an empty array" do
      let(:name_ids_array) { [] } 

      it "returns an empty array" do
        expect(drawing.shuffle_and_match_names(name_ids_array)).to eq []
      end
    end
  end
end

