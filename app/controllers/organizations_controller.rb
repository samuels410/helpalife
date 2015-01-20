class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy, :join, :remove]
  before_action :prepare_other_organization, only: [:show, :display, :join, :remove]
  
  def join
    org = Organization.where(id: params['id']).first 
    if org.present? 
      current_user.organizations << org
      @join_link = use_join_link?
      respond_to do |format|
        format.js
      end
    end

  end

  def remove
    org = Organization.where(id: params['id']).first 
    if org.present? 
      current_user.organizations.delete(org)
      @join_link = use_join_link?
      respond_to do |format|
        format.js
      end
    end
  end


  def index
    @organizations = Organization.all
  end

  def show
    @users = User.all
    @join_link = use_join_link?
  end

  def display
    @organization = Organization.where(id: params["id"]).first
    @join_link = use_join_link?

    respond_to do |format|
      format.js
    end
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    #binding.pry
    if @organization.valid?
      current_user.organizations << @organization
      #@organization.save!
      current_user.save!
      redirect_to @organization
      else
        render action: :new
      end
  end

  def update
    if @organization.update(organization_params)
       redirect_to @organization
     else
      render action: :edit 
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_url
  end

  private

  def prepare_other_organization
    @other_organizations = Organization.limit(3).order('created_at  desc')
  end

  def use_join_link?
    @result ||= @organization.users.include?(current_user).try(:blank?)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name, :address, :description, :banner)
  end
  
end
