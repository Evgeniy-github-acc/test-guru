class Admin::BadgesController < ApplicationController

  before_action :set_badges, only: %i[index]
  before_action :set_badge, only: %i[ edit update destroy ]
  

  def index
    
  end

  def show

  end

  def new
    @badge = Badge.new
  end

  def edit

  end
  
  def create
    @badge = Badge.new(badge_params)
    @files = Dir.entries("app/assets/images")
    
    if @badge.save
      redirect_to admin_badges_path, notice:  t('.success')
    else
      render :new
    end
  end  


  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice:  t('.success')
  end

  private

  def set_badges
    @badges = Badge.all
  end
  
  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :file, :rule, :rule_param) 
  end

end
