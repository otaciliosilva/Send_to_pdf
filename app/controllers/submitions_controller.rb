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
    # extension=@submition.Arquivo.split('.')
    # send_file Rails.root.join('public', 'uploads', @submition.Arquivo), #busca o arquivo na pasta referida
    #     :type=>"application/#{extension[1]}", :x_sendfile=>true #tudo certo send recebe true
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

    #save file no server paste
    uploaded_io = params[:submition][:Arquivo]#envia arquivo para a pasta uploads em public
    File.open(Rails.root.join('public','uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @submition.Arquivo=uploaded_io.original_filename

    respond_to do |format|
      if @submition.save
        format.html { redirect_to @submition, notice: 'Submição Enviada com Sucesso!.' }
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
        format.html { redirect_to @submition, notice: 'Submição Alterada com  Sucesso.' }
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
      format.html { redirect_to submitions_url, notice: 'Submição Deletada com Sucesso!.' }
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
