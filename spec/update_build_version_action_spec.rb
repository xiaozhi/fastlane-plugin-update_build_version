describe Fastlane::Actions::UpdateBuildVersionAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The update_build_version plugin is working!")

      Fastlane::Actions::UpdateBuildVersionAction.run(nil)
    end
  end
end
