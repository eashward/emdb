RSpec.describe Rating, type: :model do

  describe "#update_rating" do
    let(:movie) { create(:movie) }
    subject(:rating) { create(:rating, movie_id: movie.id) }

    it "updates rating when user vote for a movie" do
      expect { subject }.to change { movie.reload.rating }
    end
  end
end
