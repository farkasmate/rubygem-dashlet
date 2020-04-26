# frozen_string_literal: true

require 'sinatra/base'

require 'dashlet/template'

module Dashlet
  class Server < Sinatra::Base
    get '/' do
      Template.render('DASHLET', 'Hello World!')
    end
  end
end
