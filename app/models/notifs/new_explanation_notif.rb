class NewExplanationNotif < UserNotif::Notif

  def email?
    # Override or delete (default: true)
    false
  end

  def template_name
    'new_explanation_notif'
  end

  def email_options
    # TODO: Add this I18n key in your yml and add options or delete the method if you want to keep default values
    super({
        subject: "Уведомление о новом сообщении"   #I18n.t('notif.new_explanation.subject')
      })
  end

  def target_class
    Explanation
  end
end
