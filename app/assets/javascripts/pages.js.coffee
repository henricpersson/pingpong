# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ =>
  search = (event) ->
    query = $(this).val().toLowerCase()
    $('.programs li').each (i, elem) ->
      $elem = $(elem)
      name = $elem.data 'name'
      $elem.toggle(
        name.indexOf(query) == 0 ||
        levenshtein(name, query) < 4
      )
  $('.search input').on('keyup', search)
