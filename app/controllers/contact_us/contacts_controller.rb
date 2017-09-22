# ToDo удали меня когда переделаешь контроллер с обратной формой
class ContactUs::ContactsController < ApplicationController

  def create
    @contact = ContactUs::Contact.new(params[:contact_us_contact])

    if check_captcha(@contact) && @contact.save
      redirect_to(ContactUs.success_redirect || '/', :notice => t('contact_us.notices.success'))
    else
      flash[:error] = t('contact_us.notices.error')
      render_new_page
    end
  end

  def new
    @contact = ContactUs::Contact.new
    render_new_page
  end

  protected

  def render_new_page
    case ContactUs.form_gem
    when 'formtastic'  then render 'new_formtastic'
    when 'simple_form' then render 'new_simple_form'
    else
      render 'new'
    end
  end

  def check_captcha(contact_form)
    if current_user.present?
      true
    else
      verify_recaptcha(model: contact_form)

    end
  end
end
