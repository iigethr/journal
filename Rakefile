# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks


namespace :static do
  desc 'Generate static site in ./out/ directory'
  task :generate do
    Dir.mkdir 'out' unless File.exist? 'out'
    Dir.chdir 'out' do
      `wget -mnH http://localhost:3000/publications/kY72THjP/preview`
    end
    `rsync -ruv --exclude=.svn/ public/ out/`
  end
end
