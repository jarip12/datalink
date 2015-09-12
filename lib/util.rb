class Util
  def self.random(length)
    num = rand(10 ** length)
    return num.to_s.rjust(length, '0')
  end

  def self.is_number?(verb)
    true if Float(verb) rescue false
  end

  def self.mobile_valid?(mobile)
    regex = Regexp.new(Setting.mobile_regex_format)
    !((mobile =~ regex).nil?)
  end
end
