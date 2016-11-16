class Person

  def initialize(name)
    @name = name
  end

  def say(message)
    binding.irb
    puts "#{@name} says '#{message}'"
  end

end

=begin
irb(main):013:0> taro = Person.new('Taro')
=> #<Person:0x007fffd10f8e70 @name="Taro">
irb(main):014:0> taro.say('The grass is always greener on the other side.')
irb(#<Person:0x007fffd10f8e70>):001:0> @name
=> "Taro"
irb(#<Person:0x007fffd10f8e70>):002:0> message
=> "The grass is always greener on the other side."
irb(#<Person:0x007fffd10f8e70>):003:0> exit
Taro says 'The grass is always greener on the other side.'
=> nil
=end
