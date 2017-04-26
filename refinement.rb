require 'rdl'
require 'types/core'

module ArrayEx
  refine Array do
    def bar
      self.to_s
    end
  end
end

# refinementは非対応
class Foo
  using ArrayEx
  type '() -> String', typecheck: :later
  def foo()
    [].bar
  end
end

Foo.new.foo

rdl_do_typecheck :later
