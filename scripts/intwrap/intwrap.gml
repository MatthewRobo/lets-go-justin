// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function intwrap(val,min,max){
	var range = max - min;
	return (val + range) mod range;
}