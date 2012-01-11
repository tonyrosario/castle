# Gems
%w[rubygems added_methods ap brice looksee pp what_methods].each do |gem_name|
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
Brice.init { |config| config.libs = %w[pp yaml tempfile benchmark what_methods irb/completion] }

# Looksee
Looksee.editor = 'mate -l%l %f'

# Aliases
alias q exit

# Methods
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end
