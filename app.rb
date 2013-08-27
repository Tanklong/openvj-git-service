require 'bundler'
require 'grape'

class OpenVJGitAPI < Grape::API

    format :json

    get ':hello' do
        {hello: 'world'}
    end
    
end