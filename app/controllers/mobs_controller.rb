# frozen_string_literal: true

class MobsController < ApplicationController
  before_action :set_mob, only: %i[show edit update destroy]
  before_action :authenticate_admin!, except: %i[index show]
  before_action :admin_have_mob, only: %i[edit update destroy]
  before_action :test, only: %i[new]

  def index
    @mobs = Mob.all
  end

  def show; end

  def new
    @mob = Mob.new
  end

  def edit; end

  def create
    @mob = Mob.new(mob_params)
    respond_to do |format|
      if @mob.save
        asso = @mob
        current_admin.update_attribute(:mob_id, asso.id)
        format.html { redirect_to root_path, notice: 'Mob was successfully created.'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @mob.update(mob_params)
        format.html { redirect_to edit_mob_path(@mob), notice: 'Mob was successfully updated.' }
        format.json { render :show, status: :ok, location: @mob }
      else
        format.html { render :edit }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mob.destroy
    respond_to do |format|
      format.html { redirect_to mobs_url, notice: 'Mob was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_mob
    @mob = Mob.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mob_params
    params.require(:mob).permit(:name, :phone, :web_url_1, :web_url_2, :description, :avatar)
  end

  # Methode qui permet de verifier que le current_admin est bien le créateur du mob
  def admin_have_mob
    unless current_admin.mob.id == @mob.id
      flash[:notice] = "Tu n'es pas autorisé a modifier cette association"
      redirect_to mobs_path
    end
  end

  def test
    unless current_admin.mob_id == nil
      redirect_to root_path
    end
  end
end
