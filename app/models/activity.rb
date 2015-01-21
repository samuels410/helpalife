class Activity < ActiveRecord::Base
  belongs_to :user

  
  def self.build_activity(organization_name)
    activity_content = "You have just created an organization #{organization_name}"
    Activity.new(content: activity_content)
  end

  def self.create_activity(organization_name)
    activity_content = "YOu have just updated organization #{organization_name} ."
    Activity.create(content: activity_content)
  end

end
