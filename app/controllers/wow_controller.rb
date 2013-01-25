class WowController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wow_characters = current_user.wow_characters
  end

  def new
    @wow_character = WowCharacter.new
  end

  def create
    @wow_character = WowCharacter.new(params[:wow_character])
    @wow_character.user = current_user
    if @wow_character.save
      flash[:notice] = "Character created!"
      redirect_to wow_index_path
    else
      render 'new'
    end
  end

  def destroy
    if WowCharacter.find(params[:id]).destroy
      flash[:notice] = "Character deleted!"
      redirect_to wow_index_path
    else
      flash[:error] = "Character deletion faild!"
      redirect_to wow_index_path
    end
  end
end
