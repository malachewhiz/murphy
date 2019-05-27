# frozen_string_literal: true

RSpec.describe Murphy::CLI do
  describe "#arguments" do
    it "returns the runtime arguments if a rubocop config flag is present" do
      runtime_arguments = ["-d", "-c .rubocop.yml"]
      cli = described_class.new(runtime_arguments)

      expect(cli.arguments).to eq runtime_arguments
    end

    it "adds the gem's rubocop.yml to the arguments if the rubocop config flag is missing" do
      runtime_arguments = ["-d"]
      cli = described_class.new(runtime_arguments)
      allow(cli).to receive(:path_to_rubocop_config).and_return("./.rubocop.yml")

      expect(cli.arguments).to eq ["-c ./.rubocop.yml", "-d"]
    end
  end

  describe "#rubocop" do
    it "calls the rubocop executable with the arguments" do
      runtime_arguments = ["-d", "--config .rubocop.yml"]
      cli = described_class.new(runtime_arguments)
      allow(cli).to receive(:system)

      cli.rubocop

      expect(cli).to have_received(:system).with("bundle exec rubocop -d --config .rubocop.yml")
    end
  end

  describe "#rubocop_git" do
    it "calls the rubocop-git executable with the arguments" do
      runtime_arguments = ["-d", "--config .rubocop.yml"]
      cli = described_class.new(runtime_arguments)
      allow(cli).to receive(:system)

      cli.rubocop_git

      expect(cli).to have_received(:system).with("bundle exec rubocop-git -d --config .rubocop.yml")
    end
  end
end
