require 'crying_angel'
require 'crying_angel/location'
require 'crying_angel/human'
require 'crying_angel/angel'

module CryingAngel
  def angel_cries?(ol, il, al)
    @olenka ?  @olenka.move_to(ol) : @olenka = Human.new('Olenka', ol)
    @ivanko ?  @ivanko.move_to(il) : @ivanko = Human.new('Ivanko', il)
    @angel  ?  @angel.move_to(al)  : @angel  = Angel.new('Castiel', al, 500)

    return false unless @angel.can_see?(@olenka) && @angel.can_see?(@ivanko)
    @olenka.location.distance_to(@ivanko.location) > 300
  end
end

include CryingAngel
