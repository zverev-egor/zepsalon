class InfosController < ApplicationController
  before_action :set_info, only: [:edit, :update, :destroy]

  before_action :check_auth, except: [:index]
  before_action :check_edit, only: [:edit, :update, :destroy]
  before_action :check_add, only: [:new, :create]

  # GET /infos
  # GET /infos.json
  def index
    @infos = Info.all
  end
  #
  # # GET /infos/1
  # # GET /infos/1.json
  # def show
  # end

  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
  end

  # POST /infos
  # POST /infos.json
  # def create
  #   @info = Info.new(info_params)
  #
  #   respond_to do |format|
  #     if @info.save
  #       format.html { redirect_to @info, notice: 'Info was successfully created.' }
  #       format.json { render :index, status: :created, location: @info }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @info.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @info = Info.new(info_params)
    if @info.save
      redirect_to root_path, notice: 'Информация созданна'
    else
      render :new
    end
  end
  # PATCH/PUT /infos/1
  # PATCH/PUT /infos/1.json
  # def update
  #   respond_to do |format|
  #     if @info.update(info_params)
  #       format.html { redirect_to @info, notice: 'Info was successfully updated.' }
  #       format.json { render :index, status: :ok, location: @info }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @info.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /infos/1
  # # DELETE /infos/1.json
  # def destroy
  #   @info.destroy
  #   respond_to do |format|
  #     format.html { redirect_to infos_url, notice: 'Info was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def update
    if @info.update(info_params)
      redirect_to infos_path, notice: 'Информация изменена'
    else
      render :edit
    end
  end


  def destroy
    if @info.destroy
      flash[:notice]="Информация удалена"
    else
      flash[:danger]="Удаление информации невозможно"
    end
    redirect_to infos_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_params
      params.require(:info).permit(:description)
    end

    def check_edit
      render_error(@info) unless @info.edit?(@current_user)
    end

    def check_add
      render_error(infos_path) unless Info.add?(@current_user)
    end
end
