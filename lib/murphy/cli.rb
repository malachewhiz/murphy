# frozen_string_literal: true

module Murphy
  class CLI
    def initialize(runtime_arguments)
      @runtime_arguments = runtime_arguments
    end

    def rubocop
      system "bundle exec rubocop " + arguments.join(" ")
    end

    def rubocop_git
      system "bundle exec rubocop-git " + arguments.join(" ")
    end

    def arguments
      @_arguments ||= default_arguments
    end

    private

    def default_arguments
      default_arguments = @runtime_arguments.dup
      config_arg = default_arguments.select { |arg| arg.start_with?("-c", "--config") }
      if config_arg.empty?
        default_arguments.unshift "-c #{path_to_rubocop_config}"
      end
      puts(args: default_arguments)
      default_arguments
    end

    def path_to_rubocop_config
      project_root = File.join File.expand_path(__dir__), ".rubocop.yml"
      gem_root = File.join File.expand_path("..", $LOAD_PATH.first), ".rubocop.yml"
      puts(project: project_root, gem: gem_root)
      [project_root, gem_root].detect { |dir| File.exists?(dir) }
    end
  end
end
