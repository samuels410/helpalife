require 'rails_helper'

RSpec.describe Api::DonorsController, :type => :controller do
  render_views
  let(:json) { JSON.parse(response.body) }
  let(:users_count) { 3 }

  before do
    users_count.times { create(:user) }
    get :index, format: :json
  end

  describe "GET /donors" do

    context 'all donors' do
      it 'returns the donors' do
        expect(json.collect.count).to eq(users_count)
      end
    end
  end

  describe "Search by donots through POST /donors" do
    context 'answer with some donors' do
      let(:name) {'test5'}
      let(:attrs) {{name: name}}
      let(:params) {{format: :json, user: attrs}}

      it 'returns one donor' do
        post :index, params

        expect(json.collect{|l| l["name"]}).to include(name)
      end
    end
  end
end
