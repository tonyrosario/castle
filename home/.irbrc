# Load gems
%w[rubygems looksee added_methods backports method_source brice hirb pp ap what_methods].each do |gem_name|
  begin
    require gem_name
  rescue LoadError => err
    if gem_name.sub(/\/.*/, '') == 'ap'
      warn 'Oops! You need to: `gem install awesome_print`'
    else
      warn "Oops! You need to: `gem install #{gem_name.sub(/\/.*/, '')}`"
    end
  end
end

# Brice
Brice.init

# Aliases
alias q exit

# Shows methods only available for a given object
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end

# Set the Looksee editor to TextMate
Looksee.editor = 'mate -l%l %f'

# Rails
if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!

  @prompt = {
    :PROMPT_I => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n > ", # Default prompt
    :PROMPT_S => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n%l> ", # Known continuation
    :PROMPT_C => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n > ",
    :PROMPT_N => "#{Rails.application.class.parent_name.downcase} (#{Rails.env}) #%03n?> ", # Unknown continuation
    :RETURN => ' => %s\n',
    :AUTO_INDENT => true
  }

  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:TONYCOCO] = @prompt
  IRB.conf[:PROMPT_MODE] = :TONYCOCO

  # Hirb
  Hirb.enable
end
