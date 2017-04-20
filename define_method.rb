require 'rdl'
require 'types/core'

class Huga
  [:huga,:hugahuga].each do |name|
    # define_methodは何とか動かせる
    type self, name, "()->Fixnum"
    define_method name do
      10
    end
  end
end

Huga.new.huga

rdl_do_typecheck :later
