require 'rdl'
require 'types/core'

class Foo
  type '() -> Fixnum', typecheck: :later
  def foo
    10
  end
end

class Bar < Foo
  type '() -> Fixnum', typecheck: :later
  def bar
    foo()
  end
end

Bar.new.bar

rdl_do_typecheck :later
