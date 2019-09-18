module Luhn
  def self.is_valid?(number)
    single_digits = number.to_s.reverse.chars.map(&:to_i)
    check = 0 

    single_digits.each_slice(2) do |o, e|
      check += o
      next unless e
      e *= 2
      e = e.divmod(10).inject(:+) if e > 9
      check += e 
    end

    return check.modulo(10) == 0
  end
end


=