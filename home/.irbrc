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

  @prompt = {
    :PROMPT_I => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n > ",  # default prompt
    :PROMPT_S => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n%l> ", # known continuation
    :PROMPT_C => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n > ",
    :PROMPT_N => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n?> ", # unknown continuation
    :RETURN => " => %s \n",
    :AUTO_INDENT => true
  }

  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:TONYCOCO] = @prompt
  IRB.conf[:PROMPT_MODE] = :TONYCOCO
end
