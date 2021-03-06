# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@ldsps.org', password: '32145678')
SupportLocale.create(ar_title: 'عربية', en_title: 'Arabic', iso_code: 'ar')
SupportLocale.create(ar_title: 'انكليزية', en_title: 'English', iso_code: 'en')


WebsiteConfig.create(ar_title: 'Website title(Ar)', en_title: 'Website title(Ar)', slug: 'ar-title', val: 'عنوان الموقع عربي')
WebsiteConfig.create(ar_title: 'Website title(En)', en_title: 'Website title(En)', slug: 'en-title', val: 'Website title')

WebsiteConfig.create(ar_title: 'logo', en_title: 'Logo', tr_title: 'logo', slug: 'logo', val: '/', t: 'image')
WebsiteConfig.create(ar_title: 'phone', en_title: 'Phone', tr_title: 'phone', slug: 'phone', val: '123456')
WebsiteConfig.create(ar_title: 'email', en_title: 'Email', tr_title: 'email', slug: 'email', val: 'info@ldsps.org')

WebsiteConfig.create(ar_title: 'facebook', en_title: 'Facebook page', tr_title: 'facebook', slug: 'facebook', val: 'http://facebook.com/page')

WebsiteConfig.create(ar_title: 'Copyright', en_title: 'Copyright(Ar)', tr_title: 'Copyright', slug: 'ar-copyright', val: 'Copyright All rights reserved ')
WebsiteConfig.create(ar_title: 'Copyright', en_title: 'Copyright(En)', tr_title: 'Copyright', slug: 'en-copyright', val: 'Copyright All rights reserved ')


WebsiteConfig.create(ar_title: 'Author', en_title: 'Author(Ar)', tr_title: 'Copyright', slug: 'ar-author', val: 'author')
WebsiteConfig.create(ar_title: 'Author', en_title: 'Author(En)', tr_title: 'Copyright', slug: 'en-author', val: 'author')

WebsiteConfig.create(ar_title: 'Homepage Cover', en_title: 'Homepage Cover', tr_title: 'Homepage Cover', slug: 'homepage-cover', val: '/', t: 'image')
WebsiteConfig.create(ar_title: 'Logo title', en_title: 'Logo title(Ar)', slug: 'ar-logo-title', val: 'عنوان الموقع عربي')
WebsiteConfig.create(ar_title: 'Logo title', en_title: 'Logo title(En)', slug: 'en-logo-title', val: 'Website title')

WebsiteConfig.create(ar_title: 'Website description(Ar)', en_title: 'Website description(Ar)', slug: 'ar-description', val: 'عنوان الموقع عربي')
WebsiteConfig.create(ar_title: 'Website description(En)', en_title: 'Website description(En)', slug: 'en-description', val: 'Website description')

WebsiteConfig.create(ar_title: 'Website keywords(Ar)', en_title: 'Website keywords(Ar)', slug: 'ar-keywords', val: 'عنوان الموقع عربي')
WebsiteConfig.create(ar_title: 'Website keywords(En)', en_title: 'Website keywords(En)', slug: 'en-keywords', val: 'Website keywords')
WebsiteConfig.create(ar_title: 'instagram', en_title: 'instagram', tr_title: 'instagram', slug: 'instagram', val: 'http://instagram.com/@page')

WebsiteConfig.create(ar_title: 'من نحن عربي', en_title: 'ar-about', tr_title: 'ar-about',slug: 'ar-about', val: 'من نحن')
WebsiteConfig.create(ar_title: 'من نحن انكليزي', en_title: 'en-about', tr_title: 'en-about',slug: 'en-about', val: 'en-about')



WebsiteConfig.create(ar_title: 'ar-address', en_title: 'ar-address', tr_title: 'ar-address',slug: 'ar-address', val: 'عنوان عربي')
WebsiteConfig.create(ar_title: 'en-address', en_title: 'en-address', tr_title: 'en-address',slug: 'en-address', val: 'en-address')
WebsiteConfig.create(ar_title: 'tr-address', en_title: 'tr-address', tr_title: 'tr-address',slug: 'tr-address', val: 'en-address')

WebsiteConfig.create(ar_title: 'twitter', en_title: 'twitter', tr_title: 'twitter', slug: 'twitter', val: 'http://twitter.com/@page')
WebsiteConfig.create(ar_title: 'instagram', en_title: 'instagram', tr_title: 'instagram', slug: 'instagram', val: 'http://instagram.com/@page')
WebsiteConfig.create(ar_title: 'skype', en_title: 'skype', tr_title: 'skype', slug: 'skype', val: 'skype_user')

WebsiteConfig.create(ar_title: 'contact-email', en_title: 'contact-email', tr_title: 'contact-email', slug: 'contact-email', val: 'test@domain.com')

WebsiteConfig.create(ar_title: 'Work', en_title: 'Work', tr_title: 'Work', slug: 'ar-work-hours', val: 'Work ..')
WebsiteConfig.create(ar_title: 'Work', en_title: 'Work', tr_title: 'Work', slug: 'en-work-hours', val: 'Work ..')
WebsiteConfig.create(ar_title: 'Work', en_title: 'Work', tr_title: 'Work', slug: 'tr-work-hours', val: 'Work ..')

WebsiteConfig.create(ar_title: 'About-Bg', en_title: 'About-Bg', tr_title: 'About-Bg', slug: 'about-bg', val: '/', t: 'image')
WebsiteConfig.create(ar_title: 'About', en_title: 'About', tr_title: 'About', slug: 'en-about-us-title', val: 'About us')
WebsiteConfig.create(ar_title: 'About', en_title: 'About', tr_title: 'About', slug: 'en-about-us-subtitle', val: 'Everything you need to know about our Company')

WebsiteConfig.create(ar_title: 'Contact-en', en_title: 'Contact', tr_title: 'Contact', slug: 'en-contact-us-title', val: 'Contact us')
WebsiteConfig.create(ar_title: 'Contact-ar', en_title: 'Contact', tr_title: 'Contact', slug: 'ar-contact-us-title', val: 'اتصل بنا')

WebsiteConfig.create(ar_title: 'Contact-en-subtitle', en_title: 'Contact', tr_title: 'Contact', slug: 'en-contact-us-subtitle', val: 'Get in Touch with Us')
WebsiteConfig.create(ar_title: 'Contact-ar-subtitle', en_title: 'Contact', tr_title: 'Contact', slug: 'ar-contact-us-subtitle', val: 'جاهزون في أي وقت')


# post types: service news gallery project
PostType.create(ar_title: 'مشروع', en_title: 'project', tr_title: 'project', slug: 'project')
PostType.create(ar_title: 'خدمة', en_title: 'report', tr_title: 'report', slug: 'report')
PostType.create(ar_title: 'album', en_title: 'album', tr_title: 'album', slug: 'album')

WebsiteConfig.create(ar_title: 'نظرية التغيير عربي', en_title: 'change-theory', tr_title: 'change-theory', slug: 'ar-change-theory', val: '/', t: 'image')
WebsiteConfig.create(ar_title: 'نظرية التغيير انكليزي', en_title: 'change-theory', tr_title: 'change-theory', slug: 'en-change-theory', val: '/', t: 'image')

WebsiteConfig.create(ar_title: 'قيمنا 1', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'ar-values-1-title', val: 'تست')
WebsiteConfig.create(ar_title: 'قيمنا 1 محتوى', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'ar-values-1-content', val: 'تست')

WebsiteConfig.create(ar_title: 'قيمنا 2', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'ar-values-2-title', val: 'تست')
WebsiteConfig.create(ar_title: 'قيمنا 2 محتوى', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'ar-values-2-content', val: 'تست')

WebsiteConfig.create(ar_title: 'قيمنا 3', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'ar-values-3-title', val: 'تست')
WebsiteConfig.create(ar_title: 'قيمنا 3 محتوى', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'ar-values-3-content', val: 'تست')

WebsiteConfig.create(ar_title: 'قيمنا 4', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'ar-values-4-title', val: 'تست')
WebsiteConfig.create(ar_title: 'قيمنا 4 محتوى', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'ar-values-4-content', val: 'تست')

WebsiteConfig.create(ar_title: 'Values 1', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'en-values-1-title', val: 'تست')
WebsiteConfig.create(ar_title: 'Values 1 content', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'en-values-1-content', val: 'تست')

WebsiteConfig.create(ar_title: 'Values 2', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'en-values-2-title', val: 'تست')
WebsiteConfig.create(ar_title: 'Values 2 content', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'en-values-2-content', val: 'تست')

WebsiteConfig.create(ar_title: 'Values 3', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'en-values-3-title', val: 'تست')
WebsiteConfig.create(ar_title: 'Values 3 content', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'en-values-3-content', val: 'تست')

WebsiteConfig.create(ar_title: 'Values 4', en_title: 'values-1-title', tr_title: 'values-1-title', slug: 'en-values-4-title', val: 'تست')
WebsiteConfig.create(ar_title: 'Values 4 content', en_title: 'values-1-content', tr_title: 'values-1-content', slug: 'en-values-4-content', val: 'تست')

WebsiteConfig.create(ar_title: 'آخر الأخبار', en_title: 'latest-news-image', tr_title: 'latest-news-image', slug: 'ar-latest-news-image', val: '/', t: 'image')
WebsiteConfig.create(ar_title: 'Latest news', en_title: 'latest-news-image', tr_title: 'latest-news-image', slug: 'en-latest-news-image', val: '/', t: 'image')
WebsiteConfig.create(ar_title: 'آخر الأخبار محتوى', en_title: 'latest-news-content', tr_title: 'latest-news-content', slug: 'ar-latest-news-content', val: 'تست')
WebsiteConfig.create(ar_title: 'Latest news content', en_title: 'latest-news-content', tr_title: 'latest-news-content', slug: 'en-latest-news-content', val: 'test')