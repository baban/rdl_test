require 'rdl'
require 'types/core'
$:.unshift "./"


# autoloadは問題なく動いている様子
class Hoge
  type '(Fixnum) -> Fixnum', typecheck: :later
  def hoge(num)
    Fuga.new.fuga(num)
  end
end
Hoge.autoload :Fuga, "fuga"

Hoge.new.hoge(10)

rdl_do_typecheck :later
