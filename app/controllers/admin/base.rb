# coding: utf-8

class Admin::Base < ApplicationController
  before_filter :authenticate_administrator
end
