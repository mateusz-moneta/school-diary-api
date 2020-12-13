class TranslationsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    language_code = params[:language_code].upcase
    translations_scope = params[:translations_scope].upcase
    translations_group = Hash.new

    Translation
      .joins(:language, :translation_key, :translation_scope)
      .select('translations.id, translation_keys.key, translations.value')
      .where('languages.code': language_code, 'translation_scopes.name': translations_scope)
      .map do |translation|
        translations_group[translation.key] = translation.value
      end

    render json: Hash[
      translations_scope,
      translations_group
    ]
  end
end
