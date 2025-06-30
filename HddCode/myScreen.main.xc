init
	; In this file, variables are declared within the init scope for relevance.
	; However, we should often declare outsite before everything runs.
	
	; [Screen Types]
	
	; The Integrated Computer Screen:
		; Directly accessible. Comes with large computer.
	blank(black)
	draw_triangle(screen_w/2, 0, 0, screen_h, screen_w, screen_h, yellow)
	write(1,1, red, "Hi, how are you?"); (0,0) is top left. (1,1) for padding.
	
	; The Dashboard Screen:
		; First, create a dashboard. Then, on it, create screens.
		; Connected through IO. One dashboard allows several screens.
	var $Dash0 = screen("Dash0",0) ;screen(aliasOrIoNumber, channelIndex)
		; Dashboard 0 known as Dash0, accessed via channel 1
	var $Dash1 = screen("Dash0",1) ;screen(aliasOrIoNumber, channelIndex)
	$Dash0.blank(black)
	
	$Dash0.write(0, 0, red, "I\nam\na\ndash-\nboard\nscreen!")
	
	
	; The Virtual Screen:
		; If we want to use a virtual screen, we need to copy it to a physical screen.
		; Best practice is to use virtual screens statically for performance purposes.
	var $VScnWidth = 80
	var $VScnHeight = 50
	var $VScn = virtualscreen($VScnWidth, $VScnHeight)
	$VScn.blank(black); clear the virtual screen with black
	$VScn.draw_circle($VScn.width/2, $VScn.height/2, 15, blue)
	$VScn.write(1, 1, red, "I am a\nvirtual\nscreen!") 
	; write a white "Hello World" message in the top left corner of the virtual screen
	screen_copy($VScn,$Dash1, 0, 0, 0, 0, $VScnWidth, $VScnHeight)