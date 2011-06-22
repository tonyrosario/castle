%w[rubygems wirble pp ap].each do |gem_name|
  begin
    require gem_name
  rescue LoadError => err
    warn "Please do: gem install #{gem_name.sub(/\/.*/,'')}"
  end
end

Wirble.init
Wirble.colorize

alias q exit

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200

# Rails 3
if defined?(Rails)
  require 'irb/completion'

  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!

  IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_N => "[#{Rails.application.class.parent_name.downcase}::#{Rails.env}] >> ",
    :PROMPT_I => "[#{Rails.application.class.parent_name.downcase}::#{Rails.env}] >> ",
    :PROMPT_S => nil,
    :PROMPT_C => "?> ",
    :RETURN => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end
