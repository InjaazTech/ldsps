namespace :configs do

	desc 'Cache website configs'
  task website_config_cache: :environment do
    WebsiteConfig.cache!
  end
end