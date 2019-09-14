class OpponentsController < ApplicationController

    get '/opponents/new' do
        erb :'/opponents/new'
    end

    post '/opponents/new' do
        @opponent = Opponent.find_by(:username => "New Opponent")

        if @opponent.update(:username => params[:opponent][:username])
            @opponent.update(params[:opponent])
            if @opponent.username != "New Opponent"
                redirect '/matches/new'
            else
                flash.now[:errors] = "Opponent cannot be 'New Opponent'"
                erb :'/opponents/new'
            end
        else
            flash.now[:errors] = @opponent.errors.full_messages.join
            erb :'/opponents/new'
        end
    end

end
