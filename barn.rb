#The barn starts out filled with x amount of grain, y amount of cats and z amount of mice. 

$n     = 0
$grain = 100000
$cats  = [8]
$mice  = [18]

MOUSE_EAT_RATE = 3
CAT_EAT_RATE   = 2

MOUSE_BIRTHRATE = 1
CAT_BIRTHRATE   = 2

MOUSE_LIFESPAN = 3
CAT_LIFESPAN   = 600

def update()
	$mice.push ($mice[$n] + MOUSE_BIRTHRATE * ($mice[$n] / 2))  # sexual reproduction
	$cats.push ($cats[$n] + ($n.odd? ? CAT_BIRTHRATE * ($cats[$n] / 2) : 0))   # ditto

	$grain -= MOUSE_EAT_RATE * $mice[$n]
	$mice[$n] -= CAT_EAT_RATE * $cats[$n]

	if $n >= MOUSE_LIFESPAN
		$mice[$n + 1] = $mice[$n + 1] - $mice[$n - MOUSE_LIFESPAN]
	end

	if $n >= CAT_LIFESPAN
		$cats[$n + 1] = $cats[$n + 1] - $cats[$n - CAT_LIFESPAN]
	end

	puts ":::::::DAY " + $n.to_s
	puts "Amount of Grain: " + $grain.to_s
	puts "Amount of Cats: " + $cats[$n].to_s
	puts "Amount of Mice: " + $mice[$n].to_s
	puts "Cat History: " + $cats.inspect
	puts "Mouse History: " + $mice.inspect

	$n += 1
end
