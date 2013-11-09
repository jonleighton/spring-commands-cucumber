module Spring
  module Commands
    class Cucumber
      def env(*)
        "test"
      end

      def exec_name
        "cucumber"
      end
    end

    Spring.register_command "cucumber", Cucumber.new
    Spring::Commands::Rake.environment_matchers[/^cucumber($|:)/] = "test"
  end
end
