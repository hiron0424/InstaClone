class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "instaclone@example.com", subject: "お問い合わせ確認メール"
  end

  def post_photo(photo)
    @photo = photo

    mail to: "instaclone@example.com", subject: "画像投稿完了メール"
  end
end