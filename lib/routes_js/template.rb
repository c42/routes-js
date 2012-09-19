module RoutesJs
  module Template
    def self.render
      ERB.new(File.open(File.join(File.dirname(__FILE__), "template.js.erb")).read).result(binding)
    end
  end
end