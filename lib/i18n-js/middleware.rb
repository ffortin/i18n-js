module SimplesIdeias
  module I18n
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        verify_locale_files!
        @app.call(env)
      end

      private

      # Check if translations should be regenerated.
      # ONLY REGENERATE when these conditions are met:
      #
      # # Cache file doesn't exist
      # # Translations and cache size are different (files were removed/added)
      # # Translation file has been updated
      #
      def verify_locale_files!
        SimplesIdeias::I18n.export!
      end
    end
  end
end
