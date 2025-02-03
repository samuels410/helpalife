namespace :db do
  task remove_invalid_users: :environment do
    desc "Check and remove users with invalid email signups"
    invalid_user_ids = []
    User.where.not(email: nil).each do |user|
      puts "#{user.email} is running"
      response = User.verify_email(user.email)
      if response["status"] == "invalid"
        user.destroy
        puts "#{user.email} is deleted"
        invalid_user_ids << user.id
      end
    end

    if invalid_user_ids.count == 0
      puts "No invalid user signups found"
    end
  end
end
