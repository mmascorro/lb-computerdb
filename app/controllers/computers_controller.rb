class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]

  # GET /computers
  # GET /computers.json
  def index
    @computers = Computer.all.order("name ASC")
  end

  # GET /computers/1
  # GET /computers/1.json
  def show


  end

  # GET /computers/new
  def new
    @computer = Computer.new
    @locations = Location.all
  end

  # GET /computers/1/edit
  def edit
    @accounts = AdobeAccount.all
    @locations = Location.all
  end

  # POST /computers
  # POST /computers.json
  def create
    @computer = Computer.new(computer_params)

    respond_to do |format|
      if @computer.save
        format.html { redirect_to @computer, notice: 'Computer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @computer }
      else
        format.html { render action: 'new' }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    respond_to do |format|
      if @computer.update(computer_params)

        if params[:account_id] != ""
          @computer.adobe_account.replace( [AdobeAccount.find(params[:account_id])] )
        else
          @computer.adobe_account.delete_all
        end

        format.html { redirect_to @computer, notice: 'Computer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url }
      format.json { head :no_content }
    end
  end

  #POST
  def register

    comp = Computer.find_by_serial computer_params[:serial]

    account = ""

    if comp
      comp.update(computer_params)
      comp.touch

      if comp.adobe_account.any?
        p comp.adobe_account[0][:email]
        account = comp.adobe_account[0][:email]
      end
    else
      newComp = Computer.new(computer_params)
      newComp.save
    end

    render plain: account

  end


  #POST
  def getaccount

    comp = Computer.find_by_serial computer_params[:serial]

    account = ""

    if comp
      # comp.update(computer_params)
      # comp.touch

      if comp.adobe_account.any?
        p comp.adobe_account[0][:email]
        account = comp.adobe_account[0][:email]
      end

    end

    render plain: account

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_params
      params.require(:computer).permit(:name, :serial, :notes, :location_id)

    end
end
