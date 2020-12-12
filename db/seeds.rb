# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

WorkDay.destroy_all

WorkDay.create!([
  { name: 'Monday', short_name: 'MON' },
  { name: 'Tuesday', short_name: 'TUE' },
  { name: 'Wednesday', short_name: 'WED' },
  { name: 'Thursday', short_name: 'THU' },
  { name: 'Friday', short_name: 'FRI' }
])

p "Created #{WorkDay.count} work days"

Language.destroy_all

languages = Language.create([
  { name: 'English', code: 'EN' },
  { name: 'Polish', code: 'PL' }
])

p "Created #{Language.count} languages"

TranslationKey.destroy_all

translationKeys = TranslationKey.create([
  { key: 'ACTIONS' },
  { key: 'ASSIGNMENTS' },
  { key: 'CANCEL' },
  { key: 'CLASS-ROOM' },
  { key: 'CLASS-ROOMS' },
  { key: 'CLASS-TEACHER' },
  { key: 'CLASS-UNITS' },
  { key: 'CONNECTION-ERROR' },
  { key: 'CREATE' },
  { key: 'CREATED-AT' },
  { key: 'CREATOR-TITLE' },
  { key: 'DESIGNATION' },
  { key: 'EDIT' },
  { key: 'EDITOR-TITLE' },
  { key: 'EMAIL-BUSY' },
  { key: 'ENGLISH' },
  { key: 'ENTER-DESIGNATION' },
  { key: 'ENTER-EMAIL' },
  { key: 'ENTER-FIRST-NAME' },
  { key: 'ENTER-FLOOR' },
  { key: 'ENTER-LAST-NAME' },
  { key: 'ENTER-LOCATION' },
  { key: 'ENTER-NAME' },
  { key: 'ENTER-PASSWORD' },
  { key: 'ENTER-REPEAT-PASSWORD' },
  { key: 'ENTER-SHORT-NAME' },
  { key: 'ENTER-VALID-EMAIL' },
  { key: 'EXCUSES' },
  { key: 'FIELD-REQUIRED' },
  { key: 'FIRST-NAME' },
  { key: 'FLOOR' },
  { key: 'FRIDAY' },
  { key: 'INCORRECT-PASSWORD' },
  { key: 'ITEMS-PER-PAGE' },
  { key: 'LANGUAGE' },
  { key: 'LAST-NAME' },
  { key: 'LEGAL-GUARDIAN' },
  { key: 'LESSON-HOUR' },
  { key: 'LESSON-HOURS' },
  { key: 'LESSON-PLANS' },
  { key: 'LISTS-OF-TEACHERS-AND-SUBJECTS' },
  { key: 'LOCATION' },
  { key: "MESSAGE"},
  { key: 'MIN-LENGTH' },
  { key: 'MONDAY' },
  { key: 'NAME' },
  { key: 'OF' },
  { key: 'PAGE' },
  { key: 'PASSWORD' },
  { key: 'PLAN-OF-LESSONS' },
  { key: 'POLISH' },
  { key: 'PRAISE-AND-ATTENTION' },
  { key: 'REMEMBER' },
  { key: 'REPEAT-PASSWORD' },
  { key: 'SAVE' },
  { key: 'SET-TIME-FROM' },
  { key: 'SET-TIME-TO' },
  { key: 'SHORT-NAME' },
  { key: 'STUDENT' },
  { key: 'SUBJECT' },
  { key: 'SUBJECTS' },
  { key: 'SUBMIT' },
  { key: 'SYSTEM-ADMINISTRATOR' },
  { key: 'TEACHER' },
  { key: 'THURSDAY' },
  { key: 'TIME-FROM' },
  { key: 'TIME-TO' },
  { key: 'TITLE' },
  { key: 'TUESDAY' },
  { key: 'UNEXPECTED-ERROR-OCCURRED' },
  { key: 'UPDATED-AT' },
  { key: 'USER-ALREADY-EXIST' },
  { key: 'USER-HAS-NOT-EXIST' },
  { key: 'USER-REGISTERED' },
  { key: 'USER-TYPE' },
  { key: 'USER-UNREGISTERED' },
  { key: 'USERNAME-BUSY' },
  { key: 'WEDNESDAY' }
])

p "Created #{TranslationKey.count} keys of translations"

TranslationScope.destroy_all

translationScopes = TranslationScope.create([
  { name: 'SHARED' },
  { name: 'LOGIN' },
  { name: 'REGISTER' },
  { name: 'DASHBOARD' },
  { name: 'CONFIGURATION' },
  { name: 'CONFIGURATION-ASSIGNMENTS' },
  { name: 'CONFIGURATION-CLASS-ROOMS' },
  { name: 'CONFIGURATION-LESSON-HOURS' },
  { name: 'CONFIGURATION-LESSON-PLANS' },
  { name: 'CONFIGURATION-SUBJECTS' },
  { name: 'SETTINGS' },
  { name: 'VALIDATION' }
])

p "Created #{TranslationScope.count} scopes of translations"

Translation.destroy_all

Translation.create!([
  { translation_key_id: translationKeys[0].id, language_id: languages[0].id, translation_scope_id: translationScopes[0].id, value: 'Actions' },
  { translation_key_id: translationKeys[0].id, language_id: languages[1].id, translation_scope_id: translationScopes[0].id, value: 'Akcje' },
  { translation_key_id: translationKeys[1].id, language_id: languages[0].id, translation_scope_id: translationScopes[4].id, value: 'Assignments' },
  { translation_key_id: translationKeys[1].id, language_id: languages[1].id, translation_scope_id: translationScopes[4].id, value: 'Przynależności' },
  { translation_key_id: translationKeys[2].id, language_id: languages[0].id, translation_scope_id: translationScopes[0].id, value: 'Cancel' },
  { translation_key_id: translationKeys[2].id, language_id: languages[1].id, translation_scope_id: translationScopes[0].id, value: 'Anuluj' },
  { translation_key_id: translationKeys[3].id, language_id: languages[0].id, translation_scope_id: translationScopes[8].id, value: 'Class room' },
  { translation_key_id: translationKeys[3].id, language_id: languages[1].id, translation_scope_id: translationScopes[8].id, value: 'Sala lekcyjna' },
  { translation_key_id: translationKeys[4].id, language_id: languages[0].id, translation_scope_id: translationScopes[4].id, value: 'Class rooms' },
  { translation_key_id: translationKeys[4].id, language_id: languages[1].id, translation_scope_id: translationScopes[4].id, value: 'Sale lekcyjne' },
  { translation_key_id: translationKeys[5].id, language_id: languages[0].id, translation_scope_id: translationScopes[4].id, value: 'Class rooms' },
  { translation_key_id: translationKeys[5].id, language_id: languages[1].id, translation_scope_id: translationScopes[4].id, value: 'Sale lekcyjne' },
])

p "Created #{Translation.count} translations"