class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET people/1/emails
  def index
    @emails = @person.emails
  end

  # GET people/1/emails/1
  def show
  end

  # GET people/1/emails/new
  def new
    @email = @person.emails.build
  end

  # GET people/1/emails/1/edit
  def edit
  end

  # POST people/1/emails
  def create
    @email = @person.emails.build(email_params)

    if @email.save
      redirect_to(@email.person)
    else
      render action: 'new'
    end
  end

  # PUT people/1/emails/1
  def update
    if @email.update_attributes(email_params)
      redirect_to([@email.person, @email], notice: 'Email was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE people/1/emails/1
  def destroy
    @email.destroy

    redirect_to(@person)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = current_user.people.find(params[:person_id])
    end

    def set_email
      @email = @person.emails.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def email_params
      params.require(:email).permit(:email_address, :comment)
    end
end
