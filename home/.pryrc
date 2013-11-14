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

require "rubygems" unless defined?(Gem)

# Load Gems
load_gem "ruby-nuggets", "nuggets"
load_gem "added_methods"
load_gem "brice", "brice/init" do
  # Brice.config
end
load_gem "awesome_print", "ap"
load_gem "pry-theme"
load_gem "pry-nav"
load_gem "pry-rails"
load_gem "pry-remote"
load_gem "pry-stack_explorer"
load_gem "pry-theme"

# Aliases
alias q exit

# Methods
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end

Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }

# Aliases
Pry.commands.alias_command "c", "continue"
Pry.commands.alias_command "s", "step"
Pry.commands.alias_command "n", "next"
Pry.commands.alias_command "q", "quit"

# Theme
Pry.config.theme = "twilight"
