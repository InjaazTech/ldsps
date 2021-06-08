class WebsiteController < ApplicationController
  before_action :set_locale
  before_action :set_title_description

  def index
    @home_active = true
    WebsiteConfig.refresh!
    WebsiteConfig.cache!
    @team_members = TeamMember.homepage
    @sponsers = Supplier.limit(18).order(order_position: :asc)
    @canonical_link = "/ar" if params[:locale].blank?
    @projects = PostType.find_by(slug: 'project').posts.homepage.limit(3)
    @reports = PostType.find_by(slug: 'report').posts.visible.limit(3)
  end

  def contact
    @contact_active = true
    WebsiteConfig.cache!
    @contact_user = ContactUser.new
    @title = t('header.menu.contact')
    @description = t('header.menu.contact')
  end

  # def send_contact
  #   @contact_user = ContactUser.new(contact_user_params)
  #   @contact_user.save
  #   # render 'contact'
  #   if @contact_user.save
  #     render json: {alert: 'success', message: t('contact_form.send_success')}
  #   else
  #     render json: {alert: 'error', message: t('contact_form.send_success')}
  #   end
  # end

  def send_contact
    return unless NewGoogleRecaptcha.human?(params[:new_google_recaptcha_token], "contact")
    @contact_user = ContactUser.new(contact_user_params)
    if @contact_user.save
      mg_client = Mailgun::Client.new ENV['SMTP_API_KEY'], 'api.eu.mailgun.net'
      html_content = "<p>Name: #{contact_user_params[:name]}<p> <p>Email: #{contact_user_params[:email]}</p> <p>Message: #{contact_user_params[:message]}</p>"
      message_params =  { from: "#{contact_user_params[:name]}<#{contact_user_params[:email]}>",
                          to:   'zhazeem@gmail.com',
                          subject: "New contact from website",
                          html: html_content
                        }
      mg_client.send_message 'ldsps.org', message_params
      flash[:success] = t('contact_form.send_success')
    else
      flash[:danger] = t('contact_form.send_failed')
    end
    redirect_to request.referrer #contact_us_path
  end

  def not_found
    path = params[:path]
    @wpage = Wpage.find_by_all_slugs(path)
    if @wpage.present?
      render 'wpage'
    else
      render 'not_found'
    end
  end

  def about
    @about_active = true
    WebsiteConfig.cache!
    @wpage = Wpage.find_by_en_slug('about-us')
    @title = t('header.menu.about')
    @description = t('header.menu.about')
  end

  def search
    @q = params[:q]
    @title = "#{t('search.result')}: #{@q}"
    @description = @title
    if @q.blank?
      @posts = []
    else
      @posts = current_locale == 'ar' ? Post.ar_title_like(@q).page(@page_index) : Post.en_title_like(@q).page(@page_index)
    end
  end

  def team
    @title = t('team.title')
    @description = @title
    @team_members = TeamMember.order(order_position: :asc)
  end

  def sponsers
    @title = t('sponsers.title')
    @description = @title
    @sponsers = Supplier.order(order_position: :asc)
  end

  def page
    @wpage = current_locale == 'ar' ? Wpage.find_by_ar_slug(params[:slug]) : Wpage.find_by_en_slug(params[:slug])
    @title = @wpage.title(current_locale)
    @description = @wpage.subtitle(current_locale)
    render 'wpage'
  end

  private
  def contact_user_params
    params.require(:contact_user).permit(:name, :email, :phone, :service, :subject, :message)
  end

  def set_title_description
    WebsiteConfig.cache!
    @title = WebsiteConfig.get('title', current_locale)
    @description = WebsiteConfig.get('description', current_locale)
    @keywords = WebsiteConfig.get('keywords', current_locale)
  end
end