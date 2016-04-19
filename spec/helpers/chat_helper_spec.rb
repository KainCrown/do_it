require 'rails_helper'

RSpec.describe ChatHelper, :type => :helper do
  describe '#render_user_email' do
    it 'returns author email if email exists' do
      user = create(:user)
      message = create(:message, user_id: user.id)
      expect(helper.render_user_email(message)).to eq(user.email)
    end

    it 'returns Anonymous if user without email' do
      message = create(:message)
      expect(helper.render_user_email(message)).to eq("Anonymous")
    end
  end
end
