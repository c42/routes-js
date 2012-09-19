module RoutesJs
  class Routes
    def all
      unless @all 
        Rails.application.reload_routes!
        @all = Rails.application.routes.named_routes.to_a
      else
        @all
      end
    end
    
    def whitelisted
      @whitelisted ||= all.select do |name, route|
        RoutesJs.config.whitelist.include?(name)
      end
    end
  end
end