# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
(($) ->
  $ ->
    $(".btn-success").hover (->
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

    $('#not-choosed-competences').on 'click', '.btn.btn-info.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      comp_id = arr[arr.length - 1]
      array_val = []
      value = $("#demand_competence_ids").val()
      array_val = value.split(",")
      array_val.push(comp_id)
      jQuery.unique(array_val)
      $("#demand_competence_ids").val(array_val)
      $('#group_'+comp_id).detach().prependTo('#choosed-compenences')
      $('#add_competence_'+comp_id).replaceWith("<div class='btn btn-success btn-sm' id='delete_competence_"+comp_id+"'><i class='fa fa-check fa-lg'></i></div>")
      $('#delete_competence_'+comp_id).on('hover')
      return


    $('#choosed-competences').on 'click', '.btn.btn-success.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      comp_id = arr[arr.length - 1]
      value = $("#demand_competence_ids").val()
      array_val = value.split(',').filter(Boolean)
      array_val.pop(comp_id)
      jQuery.unique(array_val)
      $("#demand_competence_ids").val(array_val)
      $('#group_'+comp_id).detach().prependTo('#not-choosed-compenences')
      $('#delete_competence_'+comp_id).replaceWith( "<div class='btn btn-info btn-sm' id='add_competence_"+comp_id+"'><i class='fa fa-plus fa-lg'></i></div>")
      $('#add_competence_'+comp_id).on('hover')
      return


    # add criterions

    $('#not-choosed-criterions').on 'click', '.btn.btn-info.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      item_id = arr[arr.length - 1]
      array_val = []
      value = $("#demand_criterion_ids").val()
      array_val = value.split(",").filter(Boolean)
      array_val.push(item_id)
      jQuery.unique(array_val)
      $("#demand_criterion_ids").val(array_val)
      $('#criterion_group_'+item_id).detach().prependTo('#choosed-criterions')
      $('#add_criterion_'+item_id).replaceWith("<div class='btn btn-success btn-sm btn-space' id='delete_criterion_"+item_id+"'><i class='fa fa-check fa-lg'></i></div>")
      $('#delete_criterion_'+item_id).on('hover')
      return


    $('#choosed-criterions').on 'click', '.btn.btn-success.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      item_id = arr[arr.length - 1]
      value = $("#demand_criterion_ids").val()
      array_val = value.split(",")
      array_val.pop(item_id)
      jQuery.unique(array_val)
      $("#demand_criterion_ids").val(array_val)
      $('#criterion_group_'+item_id).detach().prependTo('#not-choosed-criterions')
      $('#delete_criterion_'+item_id).replaceWith( "<div class='btn btn-info btn-space btn-sm' id='add_criterion_"+item_id+"'><i class='fa fa-plus fa-lg'></i></div>")
      $('#add_criterion_'+item_id).on('hover')
      return

    $('#choosed-criterions').on 'click', '.btn.btn-default.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      item_id = arr[arr.length - 1]
      console.log("Handle click on choosed-criterions item_id: "+item_id)
      return

    $('#not-choosed-criterions').on 'click', '.btn.btn-default.btn-sm', (event) ->
      div_id = this.id
      arr = div_id.split('_')
      item_id = arr[arr.length - 1]
      console.log("Handle click on NOT-choosed-criterions item_id: "+item_id)
      return

    $('[data-toggle="popover"]').popover placement: 'bottom', html: 'true'

    return
) jQuery
