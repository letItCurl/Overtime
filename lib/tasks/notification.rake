namespace :notification do
  desc "Sends SMS notification to employee asking them to log if they had overtime"
  task sms: :environment do
    puts "i'm in rake task"
  end

end
