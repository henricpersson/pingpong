# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ =>
  search = (event) ->
    query = $(this).val().toLowerCase()
    $('.programs li').each (i, elem) ->
      $elem = $(elem)
      name = $elem.data('name')
      query = query.replace /[^a-zåäö0-9 ]/, ''
      distance = levenshtein(name.substr(0, query.length), query)
      hit = name.indexOf(query) == 0 ||
            distance < query.length * .25
      $elem.toggle(hit).toggleClass('hit', hit)
  $('.search input').on('keyup', search)
