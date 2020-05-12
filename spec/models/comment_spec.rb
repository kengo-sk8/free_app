require 'rails_helper'
describe Comment do 
  describe '#show' do
    it "コメントがない場合、投稿できないこと" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
  end
end