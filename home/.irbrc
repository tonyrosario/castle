# Gems
def check_require(gem_name, gem_require=nil)
  begin
    require gem_require || gem_name
  rescue LoadError => err
    warn "Oops! You need to: `gem install #{gem_name}`"
  end
end

require 'rubygems' unless defined?(Gem)

{ 'added_methods' => nil, 'awesome_print' => 'ap', 'brice' => 'brice/init' }.each do |gem_name, gem_require|
  check_require(gem_name, gem_require)
end

# Aliases
alias q exit

# Methods
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end
