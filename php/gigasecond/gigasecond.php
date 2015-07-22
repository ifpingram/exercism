<?php

function from($start_date)
{
    return $start_date->add(new DateInterval('PT1000000000S'));
}
