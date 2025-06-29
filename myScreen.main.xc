var $myScreen = virtualscreen(100,200)

init ; Now copy the screen
	$myScreen.blank(white)
	$myScreen.write(0,0, black, "Hello World") ; 0,0 is top left
	$myScreen.draw_triangle(screen_w/2, 0, 0, screen_h, screen_w, screen_h, blue)