module RoutesJs
  def self.config
    @config
  end
  
  def self.config=(config)
    @config = config
  end
  
  def self.load_config!
    RoutesJs.config = Config.load
  end
  
  class Config
    attr_reader :namespace, :whitelist
    def self.load
      ensure_environment_available!
      config_path = File.join(Rails.root, "config", "routesjs.yml")
      config_data = File.exists?(config_path) ? YAML.load(File.read(config_path)) : {}
      self.new(config_data)
    end
    
    def self.ensure_environment_available!
      unless Rails.application.config.assets.initialize_on_precompile
        raise("Please set config.assets.initialize_on_precompile to true to allow routes-js to access your application's routes.")
      end
    end
    
    def initialize(config_data)
      @namespace = config_data["namespace"] || Rails.application.engine_name.camelize.gsub(/Application$/, '')
      @whitelist = config_data["whitelist"].map(&:to_sym) || []
    end
  end
end
