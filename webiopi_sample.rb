# -*- coding: utf-8 -*-
WebIOPiでLチカサンプルスクリプト
#!/usr/bin/env ruby

require 'net/http'

def on
  request = Net::HTTP::Post.new("/GPIO/25/value/1")
  gpio(request)
end

def off
  request = Net::HTTP::Post.new("/GPIO/25/value/0")
  gpio(request)
end

def blink
  10.times do
    on
    sleep 0.5
    off
    sleep 0.5
  end
end

def gpio(request)
  request.basic_auth 'user', 'password'
  res = Net::HTTP.start("your raspberry pi IP address", 8000) do |http|
    http.request(request)
  end
end

blink
