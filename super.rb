require 'rdl'
require 'types/core'

# superを使って継承元を手繰る動作はまだサポートされていない。
class Foo
  type '() -> Fixnum', typecheck: :later
  def foo
    10
  end
end

class Bar < Foo
  type '() -> String', typecheck: :later
  def foo
    super
  end
end

Bar.new.foo

rdl_do_typecheck :later
