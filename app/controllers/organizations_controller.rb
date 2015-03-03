class OrganizationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :display, :join, :filter]
  before_action :set_organization, only: [:show, :edit, :update, :destroy, :join, :remove]
  before_action :prepare_other_organization, only: [:show, :display, :join, :remove]
  before_action :prepare_state_district, only: [:new, :create, :edit, :update]

  def join
    if join_organization?   #org.present?
      current_user.organizations << @org
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

  def my_organization
    @organizations = current_user.get_my_organizations
    render :index
  end

  def index
    @organizations = Organization.all
  end

  def show
    @users = @organization.users.order(:name)
    @join_link = use_join_link?
    @b_groups = @users.map(&:blood_group).uniq.unshift 'All'
  end

  # filters the organizations users based on selected blood type.
  def filter
    organization = Organization.where(id: params['organization_id']).first
    @users = organization.filtered_by_blood_group(blood_type)

    respond_to do |format|
      format.js
     end
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
    @organization.assign_attributes(user_id: current_user.id)
    current_user.organizations << @organization
    current_user.created_organization(@organization)

    if @organization.valid?
      current_user.save!
      flash[:success] = "Congratulations! You just created a new Organization."
      redirect_to @organization
      else
        render action: :new
      end
  end

  def update
    if @organization.update(organization_params)
        current_user.updated_organization(@organization)
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
  def blood_type
    params['type'].strip
  end

  def join_organization?
    @org = Organization.where(id: params['id']).first
    current_user.present? && @org.present?
  end

  def prepare_state_district
    @state_names ||= State.name_list
    @district_names ||= District.name_list
  end

  def prepare_other_organization
    @other_organizations = Organization.limit(6).order('created_at desc')
  end

  def use_join_link?
    @organization.users.include?(current_user).blank? #try(:blank?)
  end

  def set_organization
    @organization = Organization.where(id: params[:id]).first
    redirect_to organizations_url if @organization.blank?
  end

  #Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name, :address, :state_id,
      :district_id, :description, :banner, :user_id)
  end

end