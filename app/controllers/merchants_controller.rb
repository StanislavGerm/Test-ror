class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit ,:update, :destroy]
  before_action :authenticate_user!, except: [:index]
<<<<<<< HEAD

=======
  # GET 
>>>>>>> a8e765b... css index
  def index
    @merchants = Merchant.search(params[:search])
  end

<<<<<<< HEAD
=======
  # GET 
  def show
  end

  # GET
>>>>>>> a8e765b... css index
  def new
    @merchant = Merchant.new
  end

<<<<<<< HEAD
  def my_merchants
    @merchants = current_user.merchants
  end

  def show; end

  def edit; end

  def create
    @merchant = Merchant.new(merchant_params.merge!("user_id" => current_user.id))
=======
  # GET 
  def edit
  end

  # POST 
  def create
       params = merchant_params.merge!(
      extra: {
        "phone_number" => merchant_params["phone_number"], 
        "website"      => merchant_params["website"]
      },
      user_id: current_user.id
    )

    

    @merchant = Merchant.new(params)
>>>>>>> a8e765b... css index

    respond_to do |format|
      if !valid_website?(merchant_params)
        format.html { redirect_to new_merchant_url, notice: "Please provide the correct website." }
        format.json { head :no_content }
      elsif !valid_phone_number?(merchant_params)
        format.html { redirect_to new_merchant_url, notice: "Please provide the correct phone number." }
        format.json { head :no_content }
      elsif @merchant.save
        format.html { redirect_to @merchant, notice: "Merchant was successfully created." }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
=======
  # PATCH/PUT 
>>>>>>> a8e765b... css index
  def update
    respond_to do |format|
      if !valid_website?(merchant_params)
        format.html { redirect_to edit_merchant_url, notice: "Please provide the correct website." }
        format.json { head :no_content }
      elsif !valid_phone_number?(merchant_params)
        format.html { redirect_to edit_merchant_url, notice: "Please provide the correct phone number." }
        format.json { head :no_content }
      elsif @merchant.update(merchant_params)
        format.html { redirect_to @merchant, notice: "Merchant was successfully updated." }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
=======
  # DELETE 
>>>>>>> a8e765b... css index
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url, notice: "Merchant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    parameters = params.require(:merchant).permit(:name, :city, :street, :country_code, :phone_number, :website).to_h
    parameters.merge!(
      extra: {
        "phone_number" => parameters.delete("phone_number"),
        "website"      => parameters.delete("website")
      }
    )
  end

  def valid_website?(params)
  return true if params[:extra]["website"].empty?
  params[:extra]["website"].match?(/https?:\/\/[\S]+/i)
  end

  def valid_phone_number?(params)
    return true if params[:extra]["website"].empty?
    params[:extra]["phone_number"].match?(/^([0-9\(\)\/\+ \-]*)$/)
  end
end