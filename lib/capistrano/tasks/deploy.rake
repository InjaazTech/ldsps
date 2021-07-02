namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  desc 'Cache website configs'
  task :website_config_cache do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current/" do
        with RAILS_ENV: fetch(:rails_env) do
          execute :rake, "configs:website_config_cache"
        end
      end
    end
  end

end 

after 'deploy:published', 'sitemap:create'
after 'deploy:finished', 'deploy:website_config_cache'