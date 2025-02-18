namespace :users do
  task cleanup_invalid_member_names: :environment do
    file_path = Rails.root.join("public", "cleanup_invalid_member_names.csv")
    CSV.open(file_path, "w") do |csv|
      users = User.all
      headers = ['id','name','email']
      csv << headers
      users.each do |user|
        csv << [user.id, user.name,user.email]
      end
    end
    puts "CSV file exported to: #{file_path}"
  end
end

