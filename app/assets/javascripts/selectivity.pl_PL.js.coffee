$(document).on 'ready page:load', ->
  $.fn.selectivity.Locale =
      ajaxError: (term) -> "Nie udało się pobrać wyników dla <b>#{escape(term)}</b>"
      loading: 'Ładowanie...'
      loadMore: 'Więcej...'
      needMoreCharacters: (numCharacters) -> "Wpisz jeszcze #{word_pluralize(numCharacters, 'znak', 'znaki', 'znaków')}"
      noResults: 'Brak wyników'
      noResultsForTerm: (term) -> "Brak wyników dla <b>#{escape(term)}</b>"


  word_pluralize = (number, wordSingle, wordFew, wordMany) ->
    number = Number(number)

    word = if number == 0 then wordMany
    else if number == 1 then wordSingle
    else if (number % 10) >= 2 && (number % 10) <= 4 && (number <= 10 || number >= 20)
      wordFew
    else
      wordMany

    "#{number} #{word}"
