class TranslationsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
    language_code = params[:language_code].upcase
    scope = params[:scope].upcase
    translation_group = Hash.new

    Translation
      .joins(:language, :translation_key, :translation_scope)
      .select('translations.id, translation_keys.key, translations.value')
      .where('languages.code': language_code, 'translation_scopes.name': scope)
      .map do |translation|
        translation_group[translation.key] = translation.value
      end

    render json: Hash[
      scope,
      translation_group
    ]
  end
end
