require 'bundler'
require 'grape'
require 'rugged'

class OpenVJGitAPI < Grape::API

    format :json

    get :ping do
        {pong: Time.now.to_i}
    end

    resource :repository do

        desc 'Create a new repository'
        post :create do
            ret = Rugged::Repository.init_at(params[:path], :bare)
            {result: ret}
        end

    end
    
end