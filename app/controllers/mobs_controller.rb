# frozen_string_literal: true

class MobsController < ApplicationController
  before_action :set_mob, only: %i[show edit update destroy]
  before_action :authenticate_admin!, except: %i[index show]
  before_action :admin_have_mob, only: %i[edit update destroy]

  # GET /mobs
  # GET /mobs.json
  def index
    @mobs = Mob.all
  end

  # GET /mobs/1
  # GET /mobs/1.json
  def show; end

  # GET /mobs/new
  def new
    @mob = Mob.new
  end

  # GET /mobs/1/edit
  def edit; end

  # POST /mobs
  # POST /mobs.json
  def create
    @mob = Mob.new(mob_params)

    respond_to do |format|
      if @mob.save
        asso = @mob
        current_admin.update_attribute(:mob_id, asso.id)

        format.html { redirect_to root_path, notice: 'Mob was successfully created.' }
        format.json { render :show, status: :created, location: @mob }
        format.js
      else
        format.html { render :new }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobs/1
  # PATCH/PUT /mobs/1.json
  def update
    respond_to do |format|
      if @mob.update(mob_params)
        format.html { redirect_to @mob, notice: 'Mob was successfully updated.' }
        format.json { render :show, status: :ok, location: @mob }
      else
        format.html { render :edit }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobs/1
  # DELETE /mobs/1.json
  def destroy
    @mob.destroy
    respond_to do |format|
      format.html { redirect_to mobs_url, notice: 'Mob was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mob
    @mob = Mob.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mob_params
    params.require(:mob).permit(:name, :phone, :web_url_1, :web_url_2, :description)
  end

  def admin_have_mob
    unless current_admin.mob.id == @mob.id
      flash[:notice] = "Tu n'es pas autorisé a modifier cette association"
      redirect_to mobs_path
    end
  end


  # def user_event_id
  #   unless @user_event.user_id == current_user.id
  #     flash[:notice] = 'Tu n es pas autoriser a modifier cet event'
  #     redirect_to user_events_path
  #   end
  # end

end
