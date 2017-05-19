require 'rdl'
require 'types/core'

# method_missing
# * superを呼んで継承する/しない
# * NoMethodErrorがありえる/ありえない
# respond_to_missing?は使えない。これはインスタンスで動かして見ないとわからないものを対象にしている。

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
