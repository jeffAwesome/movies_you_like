# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#url: "http://www.youtube.com/oembed?url="+getURI+"&format=json"
$(document).ready ->
  window.test = (response) ->
    buildTrailers(response.html)

  buildTrailers = (response) ->
    $("#videoTrailers").html(response)

  getURI = $(".video-uris").data("id")
  console.log getURI
  $.ajax(
    url: "http://noembed.com/embed?url="+getURI+"&callback=test"
    dataType: "jsonp"
  )


  setTimeout ->
    $('#add_playlists').click ->
      $(this).hide()
      $('#new_playlist_movie').show(100)
  , 1000

  $(".add-review").click (e) ->
    e.preventDefault()
    $(this).addClass('hidden')
    $(".hide-review-form, #createReview").removeClass("hidden")

  $(".hide-review-form").click (e) ->
    e.preventDefault()
    $(this).addClass('hidden')
    $("#createReview").addClass("hidden")
    $(".add-review").removeClass("hidden")

