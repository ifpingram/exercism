<?php

function from($start_date)
{
    return new Gigasecond($start_date);
}

class Gigasecond
{
    private $date;

    public function __construct(DateTime $start_date)
    {
        $this->date = $start_date;
        $this->calculate_gigasecond();
    }

    public function calculate_gigasecond()
    {
        $this->date->add(new DateInterval('PT1000000000S'));
    }

    public function format($format)
    {
        return $this->date->format($format);
    }
}