class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy, :have_same_power_across_universes]
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /families/1
  # GET /families/1.json
  def show
  end

  def create
    @family = Family.new(family_params)

    respond_to do |format|
      if @family.save
        format.json { render :show, status: :created, location: @family }
      else
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  # def update
  #   respond_to do |format|
  #     if @family.update(family_params)
  #       format.html { redirect_to @family, notice: 'Family was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @family }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @family.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def have_same_power_across_universes
    respond_to do |format|
      format.json { render json: @family.have_same_power_across_universes?}
    end
  end

  def balance_unbalanced_families
    unbalanced_family_ids = []
    Family.all.each { |f| unbalanced_family_ids.push f.id unless f.have_same_power_across_universes? }
    Family.all.each do |f|
      f.balance_family
    end
    respond_to do |format|
      format.json { render json: {}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:name)
    end
end
