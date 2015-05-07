class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  # GET /parkings
  # GET /parkings.json
  def index
    @parkings = Parking.all
  end

  # GET /parkings/1
  # GET /parkings/1.json
  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings
  # POST /parkings.json
  def create
    @parking = Parking.new(parking_params)

    respond_to do |format|
      if @parking.save
        format.html { redirect_to @parking, notice: 'Parking was successfully created.' }
        format.json { render :show, status: :created, location: @parking }
      else
        format.html { render :new }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parkings/1
  # PATCH/PUT /parkings/1.json
  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to @parking, notice: 'Parking was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking }
      else
        format.html { render :edit }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.json
  def destroy
    @parking.destroy
    respond_to do |format|
      format.html { redirect_to parkings_url, notice: 'Parking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Car Enter and exit
  def enter
    begin
      if(params[:plate])
       @car = Car.find_by_plate!(params[:plate])
       if( !@car.parkings.where("exit_time is null").first ) then
         @parking = @car.parkings.create(enter_time: Time.now)
       end
      else
      end

    rescue ActiveRecord::RecordNotFound
      @car = Car.create(plate: params[:plate])
      @parking = @car.parkings.create(enter_time: Time.now)
    end


    @parkings = Parking.where("exit_time is null")
  end

  def exit
    begin
      if(params[:plate]) then
        @car = Car.find_by_plate!(params[:plate])
        @parking = @car.parkings.where("exit_time is null").first
        if @parking then
          @parking.exit_time = Time.now
          @parking.save
        end
        # payment
        @payment = @parking.create_payment()
        @payment.unit_price = 10
        @payment.discount = 0
        @payment.total_time = ((@parking.exit_time - @parking.enter_time)/3600).round
        @payment.total = @payment.unit_price * (1 - @payment.discount) * (@payment.total_time + 1)

      end

    rescue ActiveRecord::RecordNotFound
      #@car = Car.create(plate: params[:plate])
      #@parking = @car.parkings.create(enter_time: Time.now)
    end


    @parkings = Parking.where("exit_time is null")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_params
      params.require(:parking).permit(:enter_time, :exit_time, :park_time, :leave_time, :plate)
    end
end
