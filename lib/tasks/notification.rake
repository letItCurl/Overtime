namespace :notification do
  desc "Sends SMS notification to employee asking them to log if they had overtime"
  task sms: :environment do
    @msg = "Please, log into the overtime managment app to request / confirm your overtimes"
    EmployeeUser.all.each do |employee|
      SmsTool.send_sms(number: employee.phone, message: @msg)
    end
  end

  desc "Sends Email notification to manager each days to inform pending overtime"
  task manager_email: :environment do
    @submitted_posts = Post.submitted
    @admin_users = AdminUser.all
    if @submitted_posts.count > 0
      @admin_users.each do |admin|
        ManagerMailer.email(admin).deliver
      end
    end

  end
end
