require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  before do
    sign_in create(:user)
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end

    it 'loads all of the posts into @posts' do
      first_message = create(:message)
      second_message = create(:message)
      get :index
      expect(assigns(:messages)).to match_array([first_message, second_message])
    end
  end

  describe 'POST #create' do
    it 'renders nothing' do
      params = {
        message: {
          content: 'some content'
        }
      }
      post :create, params
      response.body.should be_blank
    end

    it 'does not send_message if message is not created' do
      params = {
        message: {
          content: 'some content'
        }
      }
      allow_any_instance_of(Message).to receive(:save!).and_return(false)
      expect(PrivatePub).not_to receive(:publish_to)
      post :create, params
    end

    it 'send_message if all is ok' do
      params = {
        message: {
          content: 'some content'
        }
      }
      expect(PrivatePub).to receive(:publish_to)
      post :create, params
    end
  end
end
