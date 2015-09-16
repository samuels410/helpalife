require 'rails_helper'

RSpec.describe Api::DonorsController, :type => :controller do
  render_views
  let(:json) { JSON.parse(response.body) }
  before do
    3.times { create(:user) }
    get :index, format: :json
  end

  describe "GET /donors" do

    context 'all donors' do
      it 'returns the donors' do
        expect(json.collect{|l| l["name"]}).to include("test")
      end
    end
  end

  describe "Search by donots through POST /donors" do
    context 'answer with some donors' do
      let(:email) {'test5@email.com'}
      let(:attrs) {{email: email}}
      let(:params) {{format: :json, user: attrs}}

      it 'returns one donor' do
        post :index, params

        expect(json.collect{|l| l["email"]}).to include(email)
      end
    end
  end
end
