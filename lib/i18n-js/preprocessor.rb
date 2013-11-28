module SimplesIdeias
  module I18n
    class Preprocessor < ::Sprockets::Processor
      def evaluate(context, locals)
        if context.logical_path == Engine::I18N_TRANSLATIONS_ASSET
          config = I18n.config_file

          context.depend_on(config) if I18n.config?
          # also set up dependencies on every locale file
          ::I18n.load_path.each {|path| context.depend_on(path)}
        end

        data
      end
    end
  end
end
