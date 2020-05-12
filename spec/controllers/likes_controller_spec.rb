require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item) }
  let(:like) { create(:like, user_id: user.id, item_id: item.id) }

  describe "POST #create" do
    before do
      login_user user
    end
  end
   
  describe "DELETE #destroy" do
    before do
      login_user user
    end
  end
end