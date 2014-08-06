module Spring
  module Commands
    class Cucumber
      class << self
        attr_accessor :environment_matchers
      end

      self.environment_matchers = {
        :default => "test",
        /^features($|\/)/ => "test" # if a path is passed, make sure the default env is applied
      }

      def env(args)
        return ENV['RAILS_ENV'] if ENV['RAILS_ENV']

        self.class.environment_matchers.each do |matcher, environment|
          return environment if matcher === (args.first || :default)
        end

        nil
      end
    end

    Spring.register_command "cucumber", Cucumber.new
  end
end
