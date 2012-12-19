class WowController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wow_characters = current_user.wow_characters
  end
end
