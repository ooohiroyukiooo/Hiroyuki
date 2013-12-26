# coding: utf-8

class Admin::Base < ApplicationController
  skip_before_filter :authenticate_administrator
end
