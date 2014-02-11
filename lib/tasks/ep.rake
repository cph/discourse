require 'reports/user_report'
namespace :ep do
  
  task :weekly_report, [:email] => :environment do |t, args|
    puts "Generating a weekly report of user activity"
    generate_report(7.days.ago, Time.now, args[:email])
  end
  
  task "monthly_report", [:email] => :environment do |t, args|
    puts "Generating a monthly report of user activity"
    generate_report(30.days.ago, Time.now, args[:email])
  end
  
private
    
  def generate_report(start_date, end_date, email)
    puts "Sending report to #{email}..."
    UserReport.new(start_date, end_date, email: email).generate!
    puts "Complete!"
  end 
  
end