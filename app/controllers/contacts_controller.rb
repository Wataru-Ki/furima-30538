class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # 保存後にContactMailerを使ってcontact_mailを送信。.deliverは送信のための記述
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
