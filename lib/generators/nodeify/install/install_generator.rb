require 'rails/generators/base'

module Nodeify
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc <<DESC
Description:
  Generates package.json file for npm
DESC

      def install_package_json
        vendor "package.json" do
          <<JSON
{
  "name": "nodeify",
  "version": "0.1.0",
  "dependencies": {
    "browserify": "1.5.0"
  }
}
JSON
        end
      end

      def install_npm_modules
        rake "npm:install"
        append_to_file ".gitignore", "vendor/node_modules"
      end

    end
  end
end
