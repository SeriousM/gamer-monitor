class WotController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wot_characters = current_user.wot_characters
  end

  def new
    @wot_character = WotCharacter.new
  end

  def create
    @wot_character = WotCharacter.new(params[:wot_character])
    @wot_character.user = current_user
    if @wot_character.save
      flash[:notice] = "Character created!"
      redirect_to wot_index_path
    else
      render 'new'
    end
  end

  def destroy
    if WotCharacter.find(params[:id]).destroy
      flash[:notice] = "Character deleted!"
      redirect_to wot_index_path
    else
      flash[:error] = "Character deletion faild!"
      redirect_to wot_index_path
    end
  end
end
