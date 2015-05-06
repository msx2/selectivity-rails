require "bundler/gem_tasks"

namespace :vendor do
  desc 'Update vendored selectivity'
  task :update do
    require 'open-uri'

    root = 'https://raw.githubusercontent.com/arendjr/selectivity/master'

    src_uri = File.join(root, 'dist/selectivity-full.js')

    open(src_uri) do |f|
      dest_file = File.expand_path('../vendor/assets/javascripts/selectivity.js', __FILE__)
      puts "Writing `#{dest_file}' from `#{src_uri}'"
      File.write dest_file, f.read
    end

    Dir['vendor/assets/stylesheets/selectivity/*.sass'].each do |file|
      src_uri = File.join(root, "styles/selectivity/#{File.basename(file)}")

      open(src_uri) do |f|
        dest_file = File.expand_path("../#{file}", __FILE__)
        puts "Writing `#{dest_file}' from `#{src_uri}'"
        File.write dest_file, f.read
      end
    end
  end
end
