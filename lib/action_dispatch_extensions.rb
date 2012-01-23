class ActionDispatch::Routing::Mapper
  def localize_and_scope_for(locales, options = {}, &block)
    scoped_locales = locales - Array(options[:skip_scope])

    localized(locales) do
      locale_regexp = Regexp.new(scoped_locales.join('|'))
      scope("/:i18n_locale", :constraints => {:i18n_locale => locale_regexp}) do
        yield
      end
      yield if options[:skip_scope]
    end
  end
end
