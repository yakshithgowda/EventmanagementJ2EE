/**
 * 
 */


    	jQuery.validator.addMethod("checkemail", function(value, element) {
    	    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
    	});
    	
    	$.validator.addMethod("minValue", function(value, element, min) {
            return this.optional(element) || value > min;
        }, "Value must be greater than or equal to {0}.");

        $.validator.addMethod("maxValue", function(value, element, max) {
            return this.optional(element) || value <= max;
        }, "Value must be less than or equal to {0}.");

		jQuery(document).ready(function($) {
			$("#formValidation").validate({

				rules: {
					name:{
						required:true
					},
					phone:{
						required:true,
						minlength:10,
						maxlength:10
					},
					email:{
						required:true,
						checkemail:true
					},
					pwd:{
						required:true,
						minlength:6
					},
					conpwd:{
						required:true,
						minlength:6,
						equalTo:"#pwd"
					},
					rating:{
						required:true,
						minValue: 1,
                    	maxValue: 5
					}
				},
				messages: {
					name:{
						required:"Please Enter the name"
					},
					phone:{
						required:"Please enter phone number",
						minlength:"Please enter 10 digit mobile number",
						maxlength:"Mobile number is greater than 10 digit"
					},
					email:{
						required:"Please enter Email-ID",
						checkemail:"Please enter valid email ID"
					},
					pwd:{
						required:"Please enter Password",
						minlength:"Please enter password greater than equal to 6"
					},
					conpwd:{
						required:"Please re-enter password ",
						minlength:"Please enter password greater than equal to 6",
						equalTo:"Password doesn't match"
					}
				}
		
			});
		});

