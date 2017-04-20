require 'rdl'
require 'types/core'

class Foo
  type '(Fixnum) -> String', typecheck: :later
  def foo(num)
    # ヒアドキュメントは正しく動いた
    var_type :sql, 'String'
    sql = <<-SQL
      SELECT * from users;
    SQL
    sql
  end
end

rdl_do_typecheck :later
