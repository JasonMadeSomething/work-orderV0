
$(document).ready(function(){
    $(".status").change(function(){
        var selection = $(this).text()
        var selectionRow = $(this).parents('tr');
        if (selection == "Delete"){
            selectionRow.fadeOut('slow');
        } else if (selection == "Completed"){
            selectionRow.addClass("success");
        }
    });
});


