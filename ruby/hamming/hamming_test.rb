require 'minitest/autorun'
#require_relative 'hamming'

class Hamming
  def self.compute(strand1, strand2)
    if strand1 == strand2
      return 0
    end

    strand1_array = strand1.split('')
    strand2_array = strand2.split('')

    strand1_array.each_with_index.collect do |val,index|
      unless strand2_array[index].nil?
        strand2_array[index] == val ? 0 : 1
      end
    end.reduce(:+)
  end
end

class HammingTest < MiniTest::Unit::TestCase
  def test_no_difference_between_identical_strands
    assert_equal 0, Hamming.compute('A', 'A')
  end

  def test_complete_hamming_distance_of_for_single_nucleotide_strand
    assert_equal 1, Hamming.compute('A','G')
  end

  def test_complete_hamming_distance_of_for_small_strand
    assert_equal 2, Hamming.compute('AG','CT')
  end

  def test_small_hamming_distance
    assert_equal 1, Hamming.compute('AT','CT')
  end

  def test_small_hamming_distance_in_longer_strand
    assert_equal 1, Hamming.compute('GGACG', 'GGTCG')
  end

  def test_ignores_extra_length_on_first_strand_when_longer
    assert_equal 1, Hamming.compute('AGAGACTTA', 'AAA')
  end

  def test_ignores_extra_length_on_other_strand_when_longer
    assert_equal 2, Hamming.compute('AGG', 'AAAACTGACCCACCCCAGG')
  end

  def test_large_hamming_distance
    assert_equal 4, Hamming.compute('GATACA', 'GCATAA')
  end

  def test_hamming_distance_in_very_long_strand
    assert_equal 9, Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')
  end
end
