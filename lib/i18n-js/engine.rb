module SimplesIdeias
  module I18n
    class Engine < ::Rails::Engine
      I18N_TRANSLATIONS_ASSET = "i18n/translations"

      initializer "i18n-js.asset_dependencies", :after => "sprockets.environment",
                                                :before => "i18n-js.initialize" do
        next unless SimplesIdeias::I18n.has_asset_pipeline?


        if Rails.version >= "3.1"
          Rails.application.assets.register_preprocessor "application/javascript", Preprocessor
        end
      end

      # rewrite path cache hash at startup and before each request in development
      config.to_prepare do
        next
      end
    end
  end
end
