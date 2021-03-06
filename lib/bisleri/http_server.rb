require "eventmachine"
require 'bisleri/parser'

module Bisleri
  class HttpServer < EventMachine::Connection
    def post_init
      puts "Client connected to port 8000"
      @parser = Parser.new
    end

    def receive_data(data)
      request = @parser.parse_request(data)
      send_data "Hello World" #TODO: send an actual response
    end

    def self.start
      EventMachine::run do
        EventMachine::start_server "127.0.0.1", 8000, HttpServer
        puts 'Running HTTP Server on port 8000'
      end
    end
  end
end

