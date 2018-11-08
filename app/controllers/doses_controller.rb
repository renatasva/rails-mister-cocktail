class DosesController < ApplicationController

  def index
    @doses = Dose.all.where(cocktail_id: params[:cocktail_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: "Dose was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
