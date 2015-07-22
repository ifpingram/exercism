<?php

function raindrops($number_of_drops)
{
    $output = '';

    if($number_of_drops % 3 === 0) {
        $output = 'Pling';
    }

    if($number_of_drops % 5 === 0) {
        $output .= 'Plang';
    }

    if($number_of_drops % 7 === 0) {
        $output .= 'Plong';
    }

    return ($output) ? $output : (string)$number_of_drops;
}
