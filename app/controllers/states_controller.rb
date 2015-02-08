class StatesController < ApplicationController
  
  def get_districts
    state = State.where(id: params['id']).first
    if state.present?
      districts = state.districts_list#raise districts.inspect
      result = { key: 'success', data: districts}
      render json: result.to_json
    else
      render json: {key: 'error'}.to_json
    end
  end

end