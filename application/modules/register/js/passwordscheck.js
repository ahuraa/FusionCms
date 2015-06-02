$(document).ready(function()
{	
	$('#register_password').keyup(function()
	{
		$('#result').html(checkStrength($('#register_password').val()))
	})
	
	function checkStrength(password)
	{
		var strength = 0
		
		if (password.length < 6) { 
			$('#result').removeClass()
			$('#result').addClass('short')
			return 'Too short' 
		}
		
		if (password.length > 7) strength += 1
		
		//If password contains both lower and uppercase characters, increase strength value.
		if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1
		
		//If it has numbers and characters, increase strength value.
		if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  strength += 1 
		
		//If it has one special character, increase strength value.
		if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1
		
		//if it has two special characters, increase strength value.
		if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
		
		
		//Calculated strength value, we can return messages
		
		
		
		//If value is less than 2
		
		if (strength < 2 )
		{
			$('#result').removeClass()
			$('#result').addClass('weak')
			return 'Password Strong is : Weak'			
		}
		else if (strength == 2 )
		{
			$('#result').removeClass()
			$('#result').addClass('good')
			return 'Password Strong is : Good'		
		}
		else if (strength == 3 )
		{
			$('#result').removeClass()
			$('#result').addClass('strong')
			return 'Password Strong is : Strong'
		}
        else
        {
            $('#result').removeClass()
            $('#result').addClass('verystrong')
            return 'Password Strong is : Very Strong'
        }

	}

	function codeChange()

	{
		$("#settings_info_ajax").html('<img src="' + Config.image_path + 'ajax.gif" />');

       	$.post(Config.URL + "step_register/ChangeCodesms",
			{				
				
				csrf_token_name: Config.CSRF
			},
			function(data)
			{
				$("#settings_info_ajax").html('');
				return;
			});

	}




});