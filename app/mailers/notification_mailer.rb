class NotificationMailer < ApplicationMailer
  default from: "no-reply@eatsterapp.com"

  def comment_added
    mail(to: "salmaraz741@gmail.com",
         subject: "A comment has been added to your place")
  end
end
  