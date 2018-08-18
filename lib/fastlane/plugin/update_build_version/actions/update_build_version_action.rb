require 'fastlane/action'
require_relative '../helper/update_build_version_helper'

module Fastlane
  module Actions
    class UpdateBuildVersionAction < Action
      def self.run(params)

        ## 获取最后的commit
        last_git_commit = Actions.last_git_commit_formatted_with('%h')

        ##格式化时间
        time = Time.now.strftime("%y%M%d")

        ##组装新的版本号
        new_version = time + "g" + last_git_commit
        
        # command = "avgtool bump -all  #{new_version}"
        Fastlane::Actions::IncrementBuildNumberAction.run(build_number: new_version)
        UI.message("The update_build_version plugin is working!")
      end

      def self.description
        "更新本地的版本号，使测试版本更加容易找到基于哪个commit发布的"
      end

      def self.authors
        ["ChenJzzz"]
      end

      def self.details
        "格式：[日期]g[最后一次commit的hash值]， 例子：180815g008fa5"
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
        [:ios].include?(platform)
        true
      end
    end
  end
end
