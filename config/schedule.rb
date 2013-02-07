set :output, "/var/www/ideotron/current/log/cron.log"
every 5.minutes do
    command "cd /var/www/spotapartner/current && RAILS_ENV=#{@environment} bundle exec rake ts:index > /var/www/spotapartner/current/log/cron.log"
end

