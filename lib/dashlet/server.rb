# frozen_string_literal: true

require 'sinatra/base'

require 'dashlet/template'
require 'dashlet/web'

module Dashlet
  class Server < Sinatra::Base
    get '/' do
      Template.render('DASHLET', 'Hello World!')
    end

    get '/dash' do
      Web.render do
        <<~CONTENT
          <div id="dashlet">
            <input type="text" id="url" value="https://indeed.sch.bme.hu/time/">
            <button type="button" onclick="loadDashlet()">Refresh</button>
          </div>
        CONTENT
      end
    end
  end
end
