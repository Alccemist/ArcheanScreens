; Include for function library
include "myFunctions.xc"
var $scnBtnCol = color(0,0,255) ;For use in our button

; [Init Scope]
init
	; Functions from myFunctions library
	@passByRef1(1,1)
	var $mod = @returnMod(7,3)
	print("7 mod 3 = " &$mod:text)
	var $doubledNum = 5;
	var $halvedNum = 50;
	var $DDS = @DoubleDivSum($doubledNum, $halvedNum)
	print($DDS)
	
	; In this file, many variables are declared within the init scope
	; But global variables should be declared outside beyond scopes.
	
	; [Screen Types]
	; The Integrated Computer Screen:
		; Directly accessible. Comes with large computer.
	blank(black)
	draw_triangle(screen_w/2, 0, 0, screen_h*0.99, screen_w*0.99, screen_h*0.99, yellow)
	write(1,1, red, "Hi, how are you?"); (0,0) is top left. (1,1) for padding.
	write(screen_h/2.4, screen_w/2.3, green, "Click me!")
	
	; The Dashboard Screen:
		; First, create a dashboard. Then, on it, create screens.
		; Connected through IO. One dashboard allows several screens.
	var $screen0 = screen("dash0",0) ;screen(aliasOrIoNumber, channelIndex)
		; Dashboard 0 known as Dash0, accessed via channel 1
	var $screen1 = screen("dash0",1) ;screen(aliasOrIoNumber, channelIndex)
	$screen0.blank(black)
	$screen0.write(0, 0, red, "I\nam\na\ndash-\nboard\nscreen!")
	
	var $hdScreen0 = screen("dash0",2) 
	; This is an HD screen! Lots of pixels in a small frame.
		; HD means scaling text and other elements up if need.
		; Probably takes up more resources too
	$hdScreen0.blank(color(255, 255, 255, 128)) ; RGBA format. 128 is halfway
	$hdScreen0.text_size(2)
	$hdScreen0.write(1,1, green, "I'm an HD screen!")
	$hdScreen0.write(60,25, cyan, "Higher \n pixel \n  density!")
		; Polygon refresher: arguments after color are XY-pts (x_n,y_n)
	$hdScreen0.draw_poly(green, 0, 25, 25, 50, 50, 25)
	
	; The Virtual Screen:
		; If we want to use a virtual screen, we need to copy it to a physical screen.
		; Best practice is to use virtual screens statically for performance purposes.
	var $vScnWidth = 80
	var $vScnHeight = 50
	var $vScn = virtualscreen($vScnWidth, $vScnHeight)
	$vScn.blank(black); clear the virtual screen with black
	$vScn.draw_circle($vScn.width/2, $vScn.height/2, 15, blue)
	$vScn.write(1, 1, red, "I am a\nvirtual\nscreen!") 
		
	screen_copy($vScn,$screen1, 0, 0, 0, 0, $vScnWidth, $vScnHeight)
	
; [Tick Scope]
tick
	; [User Interaction!]
	; Buttons:
	; button(x0, y0, color, size_x, size_y)
	; To continuously check status of the button, 
	; try it in tick. Init means it only checks upon initialization.
	var $scnButton = button(screen_h/2, screen_w/2, $scnBtnCol, 25, 25)
	if $scnButton
		print("Screen Button clicked by user:" &user)
		
	; [Loops, repeat & for]
		; Loops create a new variable for themselves inside parentheses.
		; That means you can't use one previously declared.
		;repeat 3 ($i) <- repeat this block 3 times. $i is the step index, 0-indexed
			; output.1 ($i) <- this outputs $i to a virtual device at port 1
		;for 0, 2 ($i) ; val of $i goes from 0 to 2 inclusively, meaning 3 iterations.
			;print($i)
			
		; Let's use a repeat to repeat a color operation on our button when clicked:
		repeat 3($i)
			$scnBtnCol = $scnBtnCol + $scnBtnCol/3
			; Find a way to delay each step. Maybe consult blueprints?