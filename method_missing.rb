require 'rdl'
require 'types/core'

class Foo
  type '() -> String', typecheck: :later
  def foo()
    bar(10) # call method_missing
  end

  type '(Symbol, *%any) -> String'
  def method_missing(name, *_)
    name.to_s
  end
end

Foo.new.foo

rdl_do_typecheck :later
