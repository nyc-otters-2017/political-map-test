class CongressController < ApplicationController
  def all
    require 'net/http'
    require 'uri'

    uri = URI.parse("https://api.propublica.org/congress/v1/114/house/bills/introduced.json")
    request = Net::HTTP::Get.new(uri)
    request["X-Api-Key"] = "apikey"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    @response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    # debugger
    render json: JSON.parse(@response.body)
  end
end
