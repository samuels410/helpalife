class ContactsController < ApplicationController
  load_and_authorize_resource :only => [:show]

  def index
    @contact = Contact.new()
  end

  def show

  end

  def create
    @contact = Contact.create(name: params[:contact][:name],email: params[:contact][:email],
                              subject: params[:contact][:subject],message: params[:contact][:message] )
    if @contact.save
      NotificationMailer.delay.contact_email(params[:contact][:name],params[:contact][:message],params[:contact][:email],
                               params[:contact][:subject])
      flash[:success] = "Your request is sent we will contact you soon !"
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def permitted_params
    params.permit(:name,:email,:subject,:message)
  end

end