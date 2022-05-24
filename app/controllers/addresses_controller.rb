class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET people/1/addresses
  def index
    @addresses = @person.addresses
  end

  # GET people/1/addresses/1
  def show
  end

  # GET people/1/addresses/new
  def new
    @address = @person.addresses.build
  end

  # GET people/1/addresses/1/edit
  def edit
  end

  # POST people/1/addresses
  def create
    @address = @person.addresses.build(address_params)

    if @address.save
      redirect_to(@address.person)
    else
      render action: 'new'
    end
  end

  # PUT people/1/addresses/1
  def update
    if @address.update_attributes(address_params)
      redirect_to(@address.person, notice: 'Address was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE people/1/addresses/1
  def destroy
    @address.destroy

    redirect_to(@person)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = current_user.people.find(params[:person_id])
    end

    def set_address
      @address = @person.addresses.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(:street, :town, :zip_code, :state, :country, :person_id)
    end
end
