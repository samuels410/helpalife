require 'rails_helper'

RSpec.describe Api::DonorsController, :type => :controller do
  render_views
  let(:json) { JSON.parse(response.body) }

  describe "GET /donors" do
    before do
      3.times { create(:user) }
      get :index, format: :json
    end

    context 'all donors' do
      it 'returns the donors' do
        expect(json.collect{|l| l["name"]}).to include("test")
      end
    end
  end
end
