class SubmitionsController < ApplicationController
  before_action :set_submition, only: [:show, :edit, :update, :destroy]

  # GET /submitions
  # GET /submitions.json
  def index
    @submitions = Submition.all
  end

  # GET /submitions/1
  # GET /submitions/1.json
  def show
  end

  # GET /submitions/new
  def new
    @submition = Submition.new
  end

  # GET /submitions/1/edit
  def edit
  end

  # POST /submitions
  # POST /submitions.json
  def create
    @submition = Submition.new(submition_params)

    respond_to do |format|
      if @submition.save
        format.html { redirect_to @submition, notice: 'Submition was successfully created.' }
        format.json { render :show, status: :created, location: @submition }
      else
        format.html { render :new }
        format.json { render json: @submition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submitions/1
  # PATCH/PUT /submitions/1.json
  def update
    respond_to do |format|
      if @submition.update(submition_params)
        format.html { redirect_to @submition, notice: 'Submition was successfully updated.' }
        format.json { render :show, status: :ok, location: @submition }
      else
        format.html { render :edit }
        format.json { render json: @submition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submitions/1
  # DELETE /submitions/1.json
  def destroy
    @submition.destroy
    respond_to do |format|
      format.html { redirect_to submitions_url, notice: 'Submition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submition
      @submition = Submition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submition_params
      params.require(:submition).permit(:Atividade, :Arquivo)
    end
end
