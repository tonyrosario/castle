# Load gems
%w[rubygems wirble pp ap what_methods].each do |gem_name|
  begin
    require gem_name
  rescue LoadError => err
    warn "Please do: gem install #{gem_name.sub(/\/.*/,'')}"
  end
end

# Colorize results
Wirble.init
Wirble.colorize

# Aliases
alias q exit

# local_methods shows methods only available for a given object
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end

# IRB configuration
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200

# Rails 3
if defined?(Rails)
  require 'irb/completion'
  require 'irb/ext/save-history'

  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!

  IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_I => "[#{Rails.application.class.parent_name.downcase}::#{Rails.env}] >> "
  }
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end
