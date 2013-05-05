require 'gamer_stats'

class Bf3Controller < ApplicationController
  before_filter :authenticate_user!

  def index
    @bf3_characters = current_user.bf3_characters
  end

  def new
    @bf3_character = Bf3Character.new
  end

  def create
    @bf3_character = Bf3Character.new(params[:bf3_character])
    @bf3_character.user = current_user
    if @bf3_character.save
      flash[:notice] = "Character created!"
      redirect_to bf3_index_path
    else
      render 'new'
    end
  end

  def destroy
    if Bf3Character.find(params[:id]).destroy
      flash[:notice] = "Character deleted!"
      redirect_to bf3_index_path
    else
      flash[:error] = "Character deletion faild!"
      redirect_to bf3_index_path
    end
  end

  def refresh(bf3_id)
    bf3_char = Bf3Character.find(bf3_id)

    player = GamerStats::Bf3::Player.new(bf3_char.name, bf3_char.platform.to_s)

    begin
      stats = player.load('clear,imgInfo,rank')['stats'] # get only the ranks for now
    rescue
      flash[:error] = "Error on loading the statistics for the character."
      redirect_to bf3_index_path
      return
    end

    fact_sheet = Bf3CharacterSheet.new
    fact_sheet.bf3_character = bf3_char
    fact_sheet.rank_name = stats['rank']['name']
    fact_sheet.rank_image = "http://files.bf3stats.com/img/bf3/#{stats['rank']['img_medium']}"

    if fact_sheet.save
      flash[:notice] = "Character updated successful!"
    else
      flash[:error] = "Error on updating the character."
    end

    redirect_to bf3_index_path
  end
end