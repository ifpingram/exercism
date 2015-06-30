<?php

function toRna($dna_nucleotides)
{
    $dna_rna_conversions = ['G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U'];

    $rna = '';

    foreach(str_split($dna_nucleotides) as $dna_nucleotide)
    {
        $rna .= $dna_rna_conversions[$dna_nucleotide];
    }

    return $rna;
}