class OpponentsController < ApplicationController

    get '/opponents/new' do
        erb :'/opponents/new'
    end

    post '/opponents/new' do
        @opponent = Opponent.find_by(:username => "New Opponent")

        if @opponent.update(:username => params[:opponent][:username])
            @opponent.update(params[:opponent])
            redirect '/matches/new'
        else
            flash[:errors] = @opponent.errors.full_messages.join
            erb :'/opponents/new'
        end
    end

end
