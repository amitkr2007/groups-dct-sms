/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function newProjectValidate()
{
    $(document).ready(function() {
	$("#btnsubmit").click(function(){
	    var hasError = false;
	    if($("#ProjectName").val() == ''){
		    $("#ProjectNameErrMsg").html("Project name is required");
		    $("#ProjectName").removeClass("inp-form");
		    $("#ProjectName").addClass("inp-form-error");
		    hasError = true;
		}
		else {
		    $("#ProjectNameErrMsg").html("");
		    $("#ProjectName").removeClass("inp-form-error");
		    $("#ProjectName").addClass("inp-form");
		}

		if(hasError == true)
		    return false;
	});
    });
}


