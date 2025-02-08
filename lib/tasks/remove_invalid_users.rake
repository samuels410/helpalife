namespace :db do
  task remove_invalid_users: :environment do
    desc "Check and remove users with invalid email signups"
    invalid_user_ids = []
    User.where.not(email: nil).each do |user|
      puts "#{user.email} is running"
      response = User.verify_email(user.email)
      if response.present? && ((response["status"] == "invalid") || (response["status"] == "accept_all"))
        user.destroy
        puts "#{user.email} is deleted"
        invalid_user_ids << user.id
      end
    end

    if invalid_user_ids.count == 0
      puts "No invalid user signups found"
    end
  end

  task remove_invalid_phones: :environment do
    desc "check and remove users with invalid phone number"
    User.where.not(phone_no: nil).each do |user|
      puts "#{user.phone_no} is running"
      if user.phone_no.length != 10 || user.phone_no !~ User::VALID_PHONE_REGEX
        user.destroy
        puts "#{user.phone_no} is deleted"
      end
    end
  end
end


