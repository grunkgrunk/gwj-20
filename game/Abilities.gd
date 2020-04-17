extends HBoxContainer


func reset():
	$C.modulate.a = 1
	$V.modulate.a = 1

func use(n, success):
	if n==1 and success:
		$C.modulate.a = 0.5
	if n==2 and success:
		$V.modulate.a = 0.5
		
