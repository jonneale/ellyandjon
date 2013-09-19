require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'newrelic_rpm'
require File.join(File.dirname(__FILE__), *%w[lib server])

run EllyAndJon.new