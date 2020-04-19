# frozen_string_literal: true

require 'sinatra/base'

require 'time_dashlet/template'

module TimeDashlet
  class Server < Sinatra::Base
    get '/' do
      Template.render('Current time', Time.now.utc)
    end
  end
end
