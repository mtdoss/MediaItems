class ItemsController < ApplicationController
  before_filter :require_signin!
end
