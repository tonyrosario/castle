%w[rubygems wirble pp].each do |gem_name|
  begin
    require gem_name
  rescue LoadError => err
    warn "Please do: gem install #{gem_name.sub(/\/.*/,'')}"
  end
end

Wirble.init
Wirble.colorize

alias q exit

# Print SQL to STDOUT
if ENV.include?('RAILS_ENV') # Rails 2
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end
elsif defined?(Rails) # Rails 3
  if Rails.logger
    Rails.logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
end