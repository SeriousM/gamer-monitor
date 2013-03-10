class ActivitiesController < ApplicationController
  
  def index
    @activities = PublicActivity::Activity.order_by(:created_at.desc)
  end
end