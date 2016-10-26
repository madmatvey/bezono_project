(function() {
  (function($) {
    return $(function() {
      $("body").on('click', function(e) {
        var arr_cmd, array_val, cmd, cmd_element_id, element_id, value;
        element_id = event.target.id;
        arr_cmd = element_id.split('_');
        cmd_element_id = arr_cmd[arr_cmd.length - 1];
        arr_cmd.pop();
        cmd = arr_cmd.join("_");
        console.log("COMMAND: " + cmd + " with ID: " + cmd_element_id);
        if (cmd === 'add_sub_criterion') {
          value = $("#demand_criterion_ids").val();
          array_val = value.split(",").filter(Boolean);
          array_val.push(cmd_element_id);
          jQuery.unique(array_val);
          $("#demand_criterion_ids").val(array_val);
          $('#add_sub_criterion_' + cmd_element_id).replaceWith("<div class='btn btn-success btn-sm btn-space' id='delete_criterion_" + cmd_element_id + "'><i class='fa fa-check fa-lg'></i></div>");
          $('#delete_sub_criterion_' + cmd_element_id).on('hover');
          return;
        }
        if (cmd === 'add_criterion') {
          value = $("#explanation_criterion_ids").val();
          array_val = value.split(",").filter(Boolean);
          array_val.push(cmd_element_id);
          jQuery.unique(array_val);
          $("#explanation_criterion_ids").val(array_val);
          $('#add_criterion_' + cmd_element_id).replaceWith("<div class='btn btn-success btn-sm btn-space' id='delete_criterion_" + cmd_element_id + "'><i class='fa fa-check fa-lg'></i></div>");
          $('#delete_criterion_' + cmd_element_id).on('hover');
          return;
        }
        $('[data-toggle="popover"]').each(function() {
          if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
          }
        });
      });
      $(".btn-success").hover((function() {
        var arr, comp_id, div_id;
        $(this).children().replaceWith("<i class='fa fa-minus fa-lg'>");
        div_id = this.id;
        arr = div_id.split('_');
        comp_id = arr[arr.length - 1];
      }), function() {
        var arr, comp_id, div_id;
        $(this).children().replaceWith("<i class='fa fa-check fa-lg'>");
        div_id = this.id;
        arr = div_id.split('_');
        comp_id = arr[arr.length - 1];
      });
      $('#not-choosed-competences').on('click', '.btn.btn-info.btn-sm', function(event) {
        var arr, array_val, comp_id, div_id, value;
        div_id = this.id;
        arr = div_id.split('_');
        comp_id = arr[arr.length - 1];
        array_val = [];
        value = $("#demand_competence_ids").val();
        array_val = value.split(",");
        array_val.push(comp_id);
        jQuery.unique(array_val);
        $("#demand_competence_ids").val(array_val);
        $('#group_' + comp_id).detach().prependTo('#choosed-compenences');
        $('#add_competence_' + comp_id).replaceWith("<div class='btn btn-success btn-sm' id='delete_competence_" + comp_id + "'><i class='fa fa-check fa-lg'></i></div>");
        $('#delete_competence_' + comp_id).on('hover');
      });
      $('#choosed-competences').on('click', '.btn.btn-success.btn-sm', function(event) {
        var arr, array_val, comp_id, div_id, value;
        div_id = this.id;
        arr = div_id.split('_');
        comp_id = arr[arr.length - 1];
        value = $("#demand_competence_ids").val();
        array_val = value.split(',').filter(Boolean);
        array_val.pop(comp_id);
        jQuery.unique(array_val);
        $("#demand_competence_ids").val(array_val);
        $('#group_' + comp_id).detach().prependTo('#not-choosed-compenences');
        $('#delete_competence_' + comp_id).replaceWith("<div class='btn btn-info btn-sm' id='add_competence_" + comp_id + "'><i class='fa fa-plus fa-lg'></i></div>");
        $('#add_competence_' + comp_id).on('hover');
      });
      $('#not-choosed-criterions').on('click', '.btn.btn-info.btn-sm', function(event) {
        var arr, array_val, div_id, item_id, value;
        div_id = this.id;
        arr = div_id.split('_');
        item_id = arr[arr.length - 1];
        array_val = [];
        value = $("#demand_criterion_ids").val();
        array_val = value.split(",").filter(Boolean);
        array_val.push(item_id);
        jQuery.unique(array_val);
        $("#demand_criterion_ids").val(array_val);
        $('#criterion_group_' + item_id).detach().prependTo('#choosed-criterions');
        $('#add_criterion_' + item_id).replaceWith("<div class='btn btn-success btn-sm btn-space' id='delete_criterion_" + item_id + "'><i class='fa fa-check fa-lg'></i></div>");
        $('#delete_criterion_' + item_id).on('hover');
      });
      $('#choosed-criterions').on('click', '.btn.btn-success.btn-sm', function(event) {
        var arr, array_val, div_id, item_id, value;
        div_id = this.id;
        arr = div_id.split('_');
        item_id = arr[arr.length - 1];
        value = $("#demand_criterion_ids").val();
        array_val = value.split(",");
        array_val.pop(item_id);
        jQuery.unique(array_val);
        $("#demand_criterion_ids").val(array_val);
        $('#criterion_group_' + item_id).detach().prependTo('#not-choosed-criterions');
        $('#delete_criterion_' + item_id).replaceWith("<div class='btn btn-info btn-space btn-sm' id='add_criterion_" + item_id + "'><i class='fa fa-plus fa-lg'></i></div>");
        $('#add_criterion_' + item_id).on('hover');
      });
      $('#choosed-criterions').on('click', '.btn.btn-default.btn-sm', function(event) {
        var arr, div_id, item_id;
        div_id = this.id;
        arr = div_id.split('_');
        item_id = arr[arr.length - 1];
        console.log("Handle click on choosed-criterions item_id: " + item_id);
      });
      $('#not-choosed-criterions').on('click', '.btn.btn-default.btn-sm', function(event) {
        var arr, div_id, item_id;
        div_id = this.id;
        arr = div_id.split('_');
        item_id = arr[arr.length - 1];
        console.log("Handle click on NOT-choosed-criterions item_id: " + item_id);
      });
      $('[data-toggle="popover"]').popover({
        placement: 'bottom',
        html: 'true'
      });
      return;
      return $('[data-toggle="popover"]').on('click', '.btn.btn-info.btn-sm.btn-space', function(event) {
        var arr, div_id, item_id;
        div_id = this.id;
        arr = div_id.split('_');
        item_id = arr[arr.length - 1];
        console.log("Handle click on popover-content item_id: " + item_id);
      });
    });
  })(jQuery);

}).call(this);
