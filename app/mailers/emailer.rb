class Emailer < ActionMailer::Base
  def contact(recipient, subject, message, sent_at = Time.now)
    @subject = subject
    @recipients = recipient
    @from = 'kpatidar@systematixtechnocrates.com'
    @sent_on = sent_at
    @body = message
    @headers = {}
  end

  def new_album_email(recipient,album)
    @subject = "ED Album :: New Album"
    @recipients = recipient.email_id
    @reciever = recipient
    @from = 'noreply@systematixtechnocrates.com'
    @content_type = "text/html"
    @album = album
  end
  
  def employee_email(from_user_email_id, to_users_email_ids, email_subject, email_body)
    recipients  to_users_email_ids
    subject     email_subject
    from        from_user_email_id
    body        email_body
  end

end
