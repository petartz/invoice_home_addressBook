class PhonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  # GET people/1/phones
  def index
    @phones = @person.phones
  end

  # GET people/1/phones/1
  def show
  end

  # GET people/1/phones/new
  def new
    @phone = @person.phones.build
  end

  # GET people/1/phones/1/edit
  def edit
  end

  # POST people/1/phones
  def create
    @phone = @person.phones.build(phone_params)

    if @phone.save
      redirect_to(@phone.person)
    else
      render action: 'new'
    end
  end

  # PUT people/1/phones/1
  def update
    if @phone.update_attributes(phone_params)
      redirect_to([@phone.person, @phone], notice: 'Phone was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE people/1/phones/1
  def destroy
    @phone.destroy
    redirect_to(@person)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = current_user.people.find(params[:person_id])
    end

    def set_phone
      @phone = @person.phones.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def phone_params
      params.require(:phone).permit(:phone_number, :comment)
    end
end
