CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: ENV['AWS_REGION'],
    endpoint: 'https://ams3.digitaloceanspaces.com'
  }
  config.asset_host = ENV['CDN_HOST']
  config.fog_directory  = ENV['AWS_BUCKET']
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
end