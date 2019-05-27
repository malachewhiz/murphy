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
      if config_arg.empty? && File.exists?(path_to_rubocop_config)
        default_arguments.unshift "-c #{path_to_rubocop_config}"
      end
      default_arguments
    end

    def path_to_rubocop_config
      File.join Gem::Specification.find_by_name("murphy").gem_dir, ".rubocop.yml"
    end
  end
end
