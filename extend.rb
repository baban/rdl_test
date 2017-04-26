require 'rdl'
require 'types/core'

# extendはエラーを出さないで一見正しく動いている様だが、実際には動作をパスしているだけ
module Huga
  type '() -> String', typecheck: :later
  def huga
    "huga"
  end
end

class Hoge
end

p Hoge.new.extend(Huga).huga

rdl_do_typecheck :later
