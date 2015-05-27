class StatesController < ApplicationController
  
  def get_districts
    state = State.find(params['id'])
    if state.present?
      districts = state.districts_list#raise districts.inspect
      result = { key: 'success', data: districts}
      render json: result.to_json
    else
      render json: {key: 'error'}.to_json
    end
  end

end