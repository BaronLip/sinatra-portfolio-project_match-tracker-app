class OpponentsController < ApplicationController

    get '/opponents/new' do
        erb :'/opponents/new'
    end

    post '/opponents/new' do
        @opponent = Opponent.find_by(:username => "New Opponent")
        @opponent.update(params[:opponent])
        redirect '/matches/new'
        # The below does not work because the Opponent is already "saved". How else could we validate the opponent?
        # binding.pry
        # if @opponent.save
        #     redirect '/matches/new'
        # else
        #     flash[:errors] = @opponent.errors.full_messages
        #     erb :'/opponents/new'
        # end
    end

end
