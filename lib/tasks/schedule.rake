task :scheduler => :environment do
  STDOUT.sync = true
  print "Scheduler Starting\n"
  loop do

    #Get all needs by unsent email
    @needs = Need.where(email_sent: false)

    @needs.each do |need|
      #by need get all donors
      @users = User.where(blood_group: need.blood_group,
                          district_id: need.district.id,
                          state_id: @need.state.id)
      @users.each do |user|
        NotificationMailer.delay.notify_need(user,need)
      end


    end


    print "\nGonna sleep now for 60 secs\n"
    sleep (60)
  end
end
