require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  patch '/reviews/id' do 
    review = Review.find(params[:id])
    review.update(
      score: params[:score], 
      comment: params[:comment]
    )
    review.to_json
  end

  post '/reviews' do 
    review = Review.create(
      score: params[:score], 
      comment: params[:comment], 
      game_id: params[:game_id], 
      user_id: params[:user_id]
    )
    review.to_json
  end 

  delete '/reviews/:id' do 
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end

 

end
