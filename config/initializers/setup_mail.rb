ActionMailer::Base.smtp_settings = {
  :address              => "auth.smtp.1and1.fr",
  :port                 => 587,
  :domain               => "ecdys.com",
  :user_name            => "herve.leroy@ecdys.com",
  :password             => "nextone92",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
