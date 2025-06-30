; Declare global storages
; Storage is used to keep some data persistent across power cycles and even through a re-compile.
; should ONLY be declared in the global scope
storage var $storageVar : number
storage array $storageArray : number

; Declare global vars
var $Var1 = 0
var $Var2 = 0

function @passByRef1($arg1:number, $arg2:number)
	; Modifies variables Var1, Var2 stored in the myFunctions library
	print("Originally,")
	print("var1 = "&$Var1:text)
	print("var2 = "&$Var2:text)
	$Var1 = $arg1
	$Var2 = $arg2
	print("Now = " &$Var1:text, ", " &$Var2:text)
	
function @DoubleDivSum($a:number, $b:number):number
	; Doubles a, halves b, sums them, then returns it.
	return $a*2 + $b/2
	
function @returnMod($a:number, $b:number):number
	; Returns the modulus of a and b
	return $a%$b