$(document).ready(function(){
    $('.best_in_place').best_in_place();
    $('#work_order_dueDate').datepicker();
    $.datepicker.setDefaults({ dateFormat: 'dd-mm-yy'});
    
    var presortFields = $('#presort-information-partial');
    var printingFields = $('#printing-information-partial');
    
    var presortHidden = $('#hidden-presort-information');
    var printingHidden = $('#hidden-printing-information');
    
    presortHidden.html(presortFields.html());
    presortFields.html('');
    
    printingHidden.html(printingFields.html());
    printingFields.html('');
    
    $('#work_order_project_type_id').change(function(){
        
            var selection = $(this).find('option:selected').text();
            
            if (selection == "Variable Data Mailing"){
                if (printingFields.html() == '' && presortFields.html() == ''){
                    printingFields.html(printingHidden.html()).hide().slideDown();
                    presortFields.html(presortHidden.html()).hide().slideDown();
                }
                else if(printingFields.html() == '' && !(presortFields.html() == '')){
                    printingFields.html(printingHidden.html()).hide().slideDown();
                }
                else if(!(printingFields.html() == '') && presortFields.html() == ''){
                    presortFields.html(presortHidden.html()).hide().slideDown();
                }
            }
            else if (selection == "Mailing"){
                if(!(printingFields.html() == '')){
                    printingFields.slideUp();
                    printingFields.html('');
                    presortFields.html(presortHidden.html()).hide().slideDown();

                }else{
                    presortFields.html(presortHidden.html()).hide().slideDown();
                }

            }
            else if (selection == "Print Job"){
                printingFields.html(printingHidden.html()).hide().slideDown();
                presortFields.slideUp();
                presortFields.html('');
            }
    });
    
    
    
});