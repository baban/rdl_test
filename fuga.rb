require 'rdl'
require 'types/core'

class Fuga
  type '(Fixnum) -> Fixnum', typecheck: :later
  def fuga(num)
    num
  end
end
