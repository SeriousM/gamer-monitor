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
end
