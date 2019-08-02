# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
    $('.btn.btn-danger').on 'ajax:success', ->
        $(this).closest('.card').remove()

    $('form').on 'ajax:error',(e) ->
        $('.alert.alert-danger').remove();
        post_err = e.detail[0];
        $(Object.keys(post_err)).each (index, data) ->
            $('#errors').append('<div class="alert alert-danger">'+data+' '+post_err[data]+'</div>')
$(document).on('turbolinks:load', ready)