set :output, "/var/www/ideotron/current/log/cron.log"
every 5.minutes do
    command "cd /var/www/ideotron/current && RAILS_ENV=#{@environment} bundle exec rake ts:index > /var/www/spotapartner/current/log/cron.log"
end
# every 1.day do
#     command "cd /var/www/ideotron/current && RAILS_ENV=#{@environment} backup perform -t spot_backup  --root-path /var/www/spotapartner/#{@environment}/shared/Backup > /var/www/spotapartner/#{@environment}/current/log/cron.log"
# end

