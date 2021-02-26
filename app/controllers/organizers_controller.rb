class OrganizersController < ApplicationController
    
    get '/organizers/new' do #doesnt load page properly
        erb :"/new_forms/new_organizer"
    end

    post '/organizers' do
        @organizer = Organizer.create(date_of_tasks: params[:date_of_tasks], tasks: params[:tasks])
        redirect to "organizers/#{@organizer.id}"
    end
    #show all organizers
    #add button to lead to adding new organizer
    get '/organizers' do 
        erb :"/user/organizers"
    end
end