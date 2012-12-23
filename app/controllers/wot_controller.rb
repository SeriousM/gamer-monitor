class WotController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wot_characters = current_user.wot_characters
  end
end
