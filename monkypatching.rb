require 'rdl'
require 'types/core'

class Foo
  type '(Fixnum) -> String', typecheck: :later
  def foo(num)
    num.to_s
  end
end

# monkypatchingしたメソッドはチェックの対象にならないで、最初に定義した方を取ってしまっている。。
# ここの宣言は無視されてエラーになった
class Foo
  type '(String) -> Fixnum', typecheck: :later
  def foo(s)
    s.to_i
  end
end

Foo.new.foo("10")

rdl_do_typecheck :later
