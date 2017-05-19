require 'rdl'
require 'types/core'

class Foo
  type '(Fixnum) -> Fixnum', typecheck: :later
  def foo(num)
    num
  end

  type '(Fixnum) -> String', typecheck: :later
  def bar(num)
    num.to_s
  end
end

# fooメソッドを正しく推論していた
Foo.new.send(:foo, 10)

# 一旦変数に名前を叩き込んでも、正しくsendを判断していた
bar = :foo
Foo.new.send(bar, 10)

# この形式の場合は、:fooと:barのどちらかは場合によって変わる。
# 一見動いている様に見えて、:fooと:barを両方考慮して正しく推論はしていない
# retの型はStringの場合とFixnumの場合は動的に決定されてしまっている。
ret = Foo.new.send([:foo,:bar].sample(1).first, 10)

rdl_do_typecheck :later
