# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
(($) ->
  $ ->
    $('#not-choosed-compenences').on 'click', '.btn.btn-info.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      comp_id = arr[arr.length - 1]

      array_val = []
      value = $("#demand_competence_ids").val()
      array_val = value.split(",")
      array_val.push(comp_id)
      $("#demand_competence_ids").val(array_val)
      $('#group_'+comp_id).detach().prependTo('#choosed-compenences')
      $('#add_competence_'+comp_id).replaceWith("<div class='btn btn-success btn-sm' id='delete_competence_"+comp_id+"'><i class='fa fa-check fa-lg'></i></div>")

      console.log 'click on not choosed element with id: ' + comp_id
      return
    $('#choosed-compenences').on 'click', '.btn.btn-success.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      comp_id = arr[arr.length - 1]

      value = $("#demand_competence_ids").val()
      array_val = value.split(",")
      array_val.pop(comp_id)
      $("#demand_competence_ids").val(array_val)
      $('#group_'+comp_id).detach().prependTo('#not-choosed-compenences')
      $('#delete_competence_'+comp_id).replaceWith( "<div class='btn btn-info btn-sm' id='add_competence_"+comp_id+"'><i class='fa fa-plus fa-lg'></i></div>")


      console.log 'click on choosed element with id: ' + comp_id
      return
    $('.btn.btn-success.btn-sm').hover (->
      $(this).children().replaceWith("<i class='fa fa-minus fa-lg'>")
      div_id = this.id
      arr = div_id.split('_')
      comp_id = arr[arr.length - 1]
      console.log 'mouse on choosed element with id: ' + comp_id
      return
      ), ->
        $(this).children().replaceWith("<i class='fa fa-check fa-lg'>")
        div_id = this.id
        arr = div_id.split('_')
        comp_id = arr[arr.length - 1]
        console.log 'mouse out of choosed element with id: ' + comp_id
        return
    return
) jQuery
