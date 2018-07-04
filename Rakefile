require 'rubygems'
    require 'rake'
    require 'rdoc'
    require 'date'
    require 'yaml'
    require 'tmpdir'
    require 'jekyll'

    desc "Generate blog files"
    task :generate do
      Jekyll::Site.new(Jekyll.configuration({
        "source"      => ".",
        "destination" => "_site"
      })).process
    end

    desc "Only publish blog to gh-pages"
    task :publish do
      Dir.mktmpdir do |tmp|
        system "mv _site/* #{tmp}"
        system "git checkout gh-pages"
        system "rm -rf *"
        system "mv #{tmp}/* ."
        message = "Site updated at #{Time.now.utc}"
        system "git add ."
        system("git", "commit", "-m", "#{message}")
        system "git push origin gh-pages"
        system "git checkout master"
        system "echo Published!"
      end
    end

    desc "Generate and publish blog to gh-pages"
    task :genpublish => [:generate] do
      Dir.mktmpdir do |tmp|
        system "mv _site/* #{tmp}"
        system "git checkout gh-pages"
        system "rm -rf *"
        system "mv #{tmp}/* ."
        message = "Site updated at #{Time.now.utc}"
        system "git add ."
        system("git", "commit", "-m", "#{message}")
        system "git push origin gh-pages"
        system "git checkout master"
        system "echo Published!"
      end
    end

task :default => :genpublish