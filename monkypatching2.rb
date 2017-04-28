require 'rdl'
require 'types/core'

class Foo
  type '(Fixnum) -> String', typecheck: :later
  def foo(num)
    num.to_s
  end
end

# モンキーパッチングでもメソッドの継ぎ足しの場合は特に問題なくチェックを行ってくれている。
class Foo
  type '(String) -> Fixnum', typecheck: :later
  def bar(s)
    s.to_i
  end
end

Foo.new.bar("10")

rdl_do_typecheck :later
