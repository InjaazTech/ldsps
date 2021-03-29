module ApplicationHelper
  def short_datetime(d)
    d.strftime('%F %R')
  end

  def current_locale
    cookies[:locale].to_s || 'ar'
  end

  def swipe_locale
    current_locale == 'ar' ? 'en' : 'ar'
  end

  def arabic?
    current_locale == 'ar'
  end
end
