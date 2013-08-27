require 'bundler'
require 'grape'
require 'rugged'

class OpenVJGitAPI < Grape::API

    format :json

    helpers do
        def checkIP
            @env['REMOTE_ADDR'] == '127.0.0.1'
        end

        def auth!
            error!('Not accepted remote address', 401) unless checkIP
        end
    end

    get :ping do
        auth!
        {pong: Time.now.to_f}
    end

    resource :repository do

        desc 'Create a new repository'
        post :create do
            auth!
            ret = Rugged::Repository.init_at(params[:path], :bare)
            {result: ret}
        end

    end
    
end