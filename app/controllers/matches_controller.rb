class MatchesController < ApplicationController

    get '/matches/new' do
        @opponents = Opponent.all
        erb :'/matches/new.html'    
    end
    
    post '/matches/new' do
        @match = Match.new(params[:match])
        @opponent = Opponent.create(params[:opponent])
        @match.opponent_id = @opponent.id
        if @match.save
            @matches = Match.where(:user_id => session[:user_id])
            redirect '/users/home'
        else
            # @error = @match.errors.full_messages
            redirect '/matches/new'
        end
    end

    get '/matches/:id/edit' do
        @match = Match.find_by(:id => params[:id])
        @opponent = Opponent.find_by(:id => @match[:opponent_id])
        erb :'/matches/edit.html'    
    end
    
    patch "/matches/:id/edit" do
        @match = Match.find_by(:id => params[:id])
        @opponent = Opponent.find_by(:id => @match[:opponent_id])
        @match.update(params[:match])
        binding.pry
        @match.save        
        redirect '/users/home'
    end

    delete '/matches/:id/delete' do
        @match = Match.find_by(:id => params[:id])
        @match.destroy
        redirect '/users/home'
    end
end
