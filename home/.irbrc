# Load gems
%w[rubygems net-http-spy looksee wirble pp ap what_methods].each do |gem_name|
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

# Shows methods only available for a given object
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end

# Rails
if defined?(Rails)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!

  rvm_ruby_string = ENV["rvm_ruby_string"] || `rvm tools identifier`.strip.split("@", 2)[0]
  rvm_ruby_gem_set_name = ENV["rvm_ruby_gem_set_name"] || `rvm tools identifier`.strip.split("@", 2)[1]
  rvm_info = "#{rvm_ruby_string}@#{rvm_ruby_gem_set_name}"

  @prompt = {
    :PROMPT_I => "\033[01;34m#{rvm_info} \033[01;32m#{Rails.application.class.parent_name.downcase} \033[00;33m(#{Rails.env}) \033[01;36m:%03n >\033[00m ",  # default prompt
    :PROMPT_S => "\033[01;34m#{rvm_info} \033[01;32m#{Rails.application.class.parent_name.downcase} \033[00;33m(#{Rails.env}) \033[01;36m:%03n%l>\033[00m ", # known continuation
    :PROMPT_C => "\033[01;34m#{rvm_info} \033[01;32m#{Rails.application.class.parent_name.downcase} \033[00;33m(#{Rails.env}) \033[01;36m:%03n >\033[00m ",
    :PROMPT_N => "\033[01;34m#{rvm_info} \033[01;32m#{Rails.application.class.parent_name.downcase} \033[00;33m(#{Rails.env}) \033[01;36m:%03n?>\033[00m ", # unknown continuation
    :RETURN => " => %s \n",
    :AUTO_INDENT => true
  }

  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:TONYCOCO] = @prompt
  IRB.conf[:PROMPT_MODE] = :TONYCOCO
end
