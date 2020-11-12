class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email,subject: "confirmation"
    #ここにcc:、bcc:を加えられる
  end
end
