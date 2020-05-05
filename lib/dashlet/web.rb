# frozen_string_literal: true

module Dashlet
  class Web
    def self.render
      html do
        yield
      end
    end

    def self.html
      html_out = <<~HEADER
      <!doctype html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Dash</title>
          <style>
            a {text-decoration: none;}

            .dashlet {
              border: none;
              color: white;
              padding: 15px 32px;
              text-align: center;
              text-decoration: none;
              display: block;
              font-family: "Courier New", Courier, monospace;
              font-size: 32px;
              margin: 4px 2px;
            }

            .red {background-color: #f44336;}
            .green {background-color: #4CAF50;}
            .blue {background-color: #008CBA;}
            .gray {background-color: #e7e7e7; color: black;}
            .black {background-color: #555555;}
          </style>
          <script>
            function loadDashlet() {
              var req = new XMLHttpRequest();
              req.onreadystatechange = function() {
                if(this.readyState === XMLHttpRequest.DONE && this.status == 200) {
                  document.getElementById("dashlet").innerHTML = card(JSON.parse(this.responseText));
                }
              };
              req.open("GET","https://indeed.sch.bme.hu/time/",false);
              req.send();
            }

            function card(dashlet) {
              return '<div class="dashlet blue">' + dashlet.title + ': ' + dashlet.message + '</div>'
            }
          </script>
          </head>
          <body>
      HEADER

      html_out += yield
      html_out += "\n"

      html_out += <<~FOOTER
          </body>
        </html>
      FOOTER
    end
  end
end
