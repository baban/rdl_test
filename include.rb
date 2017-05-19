require 'rdl'
require 'types/core'

class Baz2
  type '() -> Fixnum', typecheck: :later
  def baz
    10
  end
end

module Foo
  type '() -> Fixnum', typecheck: :later
  def foo
    10
  end
end

class Bar
  include Foo
  type '() -> Fixnum', typecheck: :later
  def bar
    foo()
  end
end

Bar.new.bar

rdl_do_typecheck :later
