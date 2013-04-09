require 'rubygems'
require 'bundler'

Bundler.require
require 'sinatra'

# The project root directory
root = ::File.dirname(__FILE__)

require './app'
run App
