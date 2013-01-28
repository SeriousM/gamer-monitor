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

  def refresh(wow_id)
    wow_char = WowCharacter.find(wow_id)

    api = Battlenet.new :eu
    resp = api.character wow_char.server_safe, wow_char.name

    fact_sheet = WowCharacterSheet.new
    fact_sheet.wow_character = wow_char
    fact_sheet.level = resp['level']
    fact_sheet.thumbnail = "http://#{wow_char.region.to_s}.battle.net/static-render/#{wow_char.region.to_s}/#{resp['thumbnail']}"

    if fact_sheet.save
      flash[:notice] = "Character updated successful!"
    else
      flash[:error] = "Error on updating the character."
    end

    redirect_to wow_index_path
  rescue Battlenet::ApiException => ex
    flash[:error] = "Error on updating the character: #{ex.reason}"
    redirect_to wow_index_path
  end
end
