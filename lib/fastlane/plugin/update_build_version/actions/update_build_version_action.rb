require 'fastlane/action'
require_relative '../helper/update_build_version_helper'

module Fastlane
  module Actions
    class UpdateBuildVersionAction < Action
      def self.run(params)
        last_git_commit = Actions.sh('git log --pretty=format:"%h" -1')
        time = Time.now.strftime("%y%M%d")
        new_version = time + "g" + last_git_commit
        puts (last_git_commit)
        UI.message("last_git_commit #{last_git_commit}")
        # command = "avgtool bump -all  #{new_version}"
        # Fastlane::Actions::IncrementBuildNumberAction.run(build_number: new_version)
        UI.message("The update_build_version plugin is working!")
      end

      def self.description
        "Append git hash value to build version"
      end

      def self.authors
        ["陈军志"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "for example : 18101014g[git_versio] , just for IRain"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "UPDATE_BUILD_VERSION_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
