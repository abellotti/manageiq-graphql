require 'manageiq/graphql/rest_api_proxy'

module ManageIQ
  module GraphQL
    class Engine < ::Rails::Engine
      ActiveSupport::Inflector.inflections(:en) do |inflect|
        inflect.acronym("ManageIQ")
        inflect.acronym("GraphQL")
        inflect.acronym("GraphiQL")
      end

      isolate_namespace ManageIQ::GraphQL

      config.autoload_paths << root.join("lib").expand_path

      initializer "graphql.add_rest_proxy" do |app|
        app.middleware.use ManageIQ::GraphQL::RESTAPIProxy
      end

      def vmdb_plugin?
        true
      end
    end
  end
end
