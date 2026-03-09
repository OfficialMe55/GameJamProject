extends Node

const DEBUG: bool = true

const FLOATPRECISION = 1000000

func addFloat(variable, floatComponent) -> float:
	variable = variable * FLOATPRECISION
	floatComponent = round(floatComponent * FLOATPRECISION)
	return (variable+floatComponent)/FLOATPRECISION

func Find_Highest_Index(array: Array):
	var highest = array[0]
	var highestIndex = -1
	var i = -1
	for element in array:
		i+=1
		if element > highest:
			highest = element
			highestIndex = i
	return highestIndex
	
