/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function RegisterValidation()
{
    var hasError = validateUsername();

    hasError = focusInValidation();

    hasError = focusOutValidation();

    $(document).ready(function() {

        $("#susubmit").click(function() {
            if($("#Username").val() == ''){
                $("#UsernameErrMsg").html("Username is required");
                $("#Username").removeClass("inp-form");
                $("#Username").addClass("inp-form-error");
                hasError = true;
            }else {
                hasError = userNameMatchRegex();
            }

            if($.trim($("#Password").val()) == ''){
                $("#PasswordErrMsg").html("Password is required");
                $("#Password").removeClass("inp-form");
                $("#Password").addClass("inp-form-error");
                hasError = true;
            }else {
                hasError = passwordMatchRegex();
            }

            var password = $("#Password").val();
            var confirmPassword = $("#ConfirmPassword").val();
            if(password != confirmPassword){
                $("#ConfirmPasswordErrMsg").html("Password not match");
                $("#ConfirmPassword").removeClass("inp-form");
                $("#ConfirmPassword").addClass("inp-form-error");
                $("#Password").removeClass("inp-form");
                $("#Password").addClass("inp-form-error");
                hasError = true;
            }

            if($("#FullName").val() == ''){
                $("#FullNameErrMsg").html("Full name is required");
                $("#FullName").removeClass("inp-form");
                $("#FullName").addClass("inp-form-error");
                hasError = true;
            }
            if($("#Email").val() == ''){
                $("#EmailErrMsg").html("Email is required");
                $("#Email").removeClass("inp-form");
                $("#Email").addClass("inp-form-error");
                hasError = true;
            }
            else {
                hasError = emailMatchRegex();
            }
            if(hasError == true)
                return false;
        });
    });
}

function focusInValidation()
{
    var hasError = false;

    $(document).ready(function() {
        $("#Username").focusin(function() {
            $("#UsernameErrMsg").html("");
            $("#Username").removeClass("inp-form-error");
            $("#Username").addClass("inp-form");
            hasError = false;
        });
    });

    $(document).ready(function() {
        $("#Password").focusin(function() {
            $("#PasswordErrMsg").html("");
            $("#Password").removeClass("inp-form-error");
            $("#Password").addClass("inp-form");
            hasError = false;
        });
    });

    $(document).ready(function() {
        $("#ConfirmPassword").focusin(function() {
            $("#ConfirmPasswordErrMsg").html("");
            $("#ConfirmPassword").removeClass("inp-form-error");
            $("#ConfirmPassword").addClass("inp-form");
            hasError = false;
        });
    });

    $(document).ready(function() {
        $("#FullName").focusin(function() {
            $("#FullNameErrMsg").html("");
            $("#FullName").removeClass("inp-form-error");
            $("#FullName").addClass("inp-form");
            hasError = false;
        });
    });

    $(document).ready(function() {
        $("#Email").focusin(function() {
            $("#EmailErrMsg").html("");
            $("#Email").removeClass("inp-form-error");
            $("#Email").addClass("inp-form");
            hasError = false;
        });
    });

    return hasError;
}

function focusOutValidation()
{
    var hasError = false;
    $(document).ready(function() {
        $("#Password").focusout(function() {
            var valueText = $("#Password").val();
            if(valueText == ''){
                $("#PasswordErrMsg").html("Password is required");
                $("#Password").removeClass("inp-form");
                $("#Password").addClass("inp-form-error");
                hasError = true;
            }
        });
    });

    $(document).ready(function() {
        $("#ConfirmPassword").focusout(function() {
            var password = $("#Password").val();
            var confirmPassword = $("#ConfirmPassword").val();
            if(password != confirmPassword){
                $("#ConfirmPasswordErrMsg").html("Password not match");
                $("#ConfirmPassword").removeClass("inp-form");
                $("#ConfirmPassword").addClass("inp-form-error");
                $("#Password").removeClass("inp-form");
                $("#Password").addClass("inp-form-error");
                hasError = true;
            }
        });
    });

    $(document).ready(function() {
        $("#FullName").focusout(function() {
            var valueText = $("#FullName").val();
            if(valueText == ''){
                $("#FullNameErrMsg").html("Full Name is required");
                $("#FullName").removeClass("inp-form");
                $("#FullName").addClass("inp-form-error");
                hasError = true;
            }
        });
    });

    $(document).ready(function() {
        $("#Email").focusout(function() {
            var valueText = $("#Email").val();
            if(valueText == ''){
                $("#EmailErrMsg").html("Please enter your email address");
                $("#Email").removeClass("inp-form");
                $("#Email").addClass("inp-form-error");
                hasError = true;
            }
            else
            {
                hasError = emailMatchRegex();
            }
        });
    });
    return hasError;
}

function emailMatchRegex()
{
    var hasError = false;
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if(!emailReg.test($("#Email").val())) {
        $("#EmailErrMsg").html("Enter a valid email address.");
        $("#Email").removeClass("inp-form");
        $("#Email").addClass("inp-form-error");
        hasError = true;
    }
    return hasError;
}

function userNameMatchRegex()
{
    var hasError = false;
    var Reg = /^[a-z0-9_-]{3,15}$/;
    if(!Reg.test($("#Username").val())) {
        $("#UsernameErrMsg").html("Username is invalid, at least 3 characters and does not constain special character");
        $("#Username").removeClass("inp-form");
        $("#Username").addClass("inp-form-error");
        hasError = true;
    }
    return hasError;
}

function passwordMatchRegex()
{
    var hasError = false;
    var Reg = /^[a-z0-9_-]{3,15}$/;
    if(!Reg.test($("#Password").val())) {
        $("#PasswordErrMsg").html("Invalid Password, at least 3 characters and does not constain special character");
        $("#Password").removeClass("inp-form");
        $("#Password").addClass("inp-form-error");
        hasError = true;
    }
    return hasError;
}

function validateUsername()
{
    var hasError = true;
    $(document).ready(function() {
        $("#Username").focusout(function() {
            var username = $("#Username").val();
            if(username == ''){
                $("#UsernameErrMsg").html("Username is required");
                $("#Username").removeClass("inp-form");
                $("#Username").addClass("inp-form-error");
                hasError = true;
            }
            else if ($("#id") == '0'){
                $.getJSON('RegisterValidate?username='+username, function(data) {
                    if(data == false){
                        $("#UsernameErrMsg").html("");
                        $("#Username").removeClass("inp-form-error");
                        $("#Username").addClass("inp-form");
                        hasError = false;
                    }
                    else{
                        $("#UsernameErrMsg").html("Username already exist.");
                        $("#Username").removeClass("inp-form");
                        $("#Username").addClass("inp-form-error");
                        hasError = true;
                    }
                });
            }
        });
    });
    return hasError;
}