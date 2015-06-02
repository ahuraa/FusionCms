var CharacterTransfer = {
	
	MODULE_NAME: 'dp_transfer',
	
	// Languge strings
	LANG_SELECT_CHAR: 'Please select a DP Value.',
	LANG_SELECT_DEST: 'Please enter destination account.',
	
	// Misc
	
	SelectedDP: null,
	DestionationAccount: null,
	
	
	
	RedirectToSuccess: function(DP_transfer,destination)
	{
		// Redirect
		document.location = Config.URL + CharacterTransfer.MODULE_NAME + "/success/"  + DP_transfer + '/' + destination;
	
	},
	
	
	
	DestAccountUpdate: function(element)
	{
		var text = $(element).val();
		
		// Check the value
		if (typeof text != 'undefined' && text.length > 0)
		{
			CharacterTransfer.DestionationAccount = text;
		}
		
		return true;
	},
	
	Submit: function()
	{
		// Get the select character
		var DP_transfer = $('#DP_transfer').find(":selected").attr('value');
		
			

		// Verify the character
		if (typeof DP_transfer == 'undefined' || DP_transfer.length == 0)
		{
			UI.alert(CharacterTransfer.LANG_SELECT_CHAR);
			return;
		}
		
	

		// Check the destination account
		if (CharacterTransfer.DestionationAccount == null)
		{
			UI.alert(CharacterTransfer.LANG_SELECT_DEST);
			return;
		}
		
		// Save the character
		CharacterTransfer.SelectedDP = DP_transfer;
		destination= CharacterTransfer.DestionationAccount;
		
		// Set a little loading message
		UI.alert('Loading...');
		
		

		// Process the transfer
		$.post(Config.URL + CharacterTransfer.MODULE_NAME + "/process", 
			{
				csrf_token_name: Config.CSRF,
				
				DP_tran: DP_transfer,
				destination: CharacterTransfer.DestionationAccount
				
			},
			function(data)
			{
				// Check for errors
				if (data != 'OK')
				{
					UI.alert(data);
				}
				else
				{
					CharacterTransfer.RedirectToSuccess(DP_transfer,destination);
				}
				return;
			}, 
			"html"
		);
		
		return true;
	}
}