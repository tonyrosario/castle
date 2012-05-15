# Gem Loader
def load_gem(gem_name, gem_require=nil, &block)
  gem_require = gem_require || gem_name
  begin
    if unbundled_require(gem_name, gem_require)
      yield if block_given?
    end
  rescue Exception => e
    warn "Couldn't load #{gem_name}: #{e}"
  end
end

def unbundled_require(gem_name, gem_require=nil)
  gem_require = gem_require || gem_name
  loaded = false
  if defined?(::Bundler)
    Gem.path.each do |gems_path|
      gem_path = Dir.glob("#{gems_path}/gems/#{gem_name}*").last
      unless gem_path.nil?
        $LOAD_PATH << "#{gem_path}/lib"
        require gem_require
        loaded = true
      end
    end
  else
    require gem_require
    loaded = true
  end

  raise(LoadError, "Couldn't find #{gem_name}") unless loaded

  loaded
end

require 'rubygems' unless defined?(Gem)

# Load Gems
load_gem 'ruby-nuggets', 'nuggets'
load_gem 'added_methods'
load_gem 'brice', 'brice/init' do
  # Brice.config
end
load_gem 'awesome_print', 'ap'

# Aliases
alias q exit

# Methods
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end
