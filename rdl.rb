require 'rdl'
require 'types/core'

print "Hello,World!\n"

class Hoge
  type '(Fixnum) -> Fixnum', typecheck: :later
  def hoge(num)
    num
  end
end

module HogeHoge
  def hoge()
    1
  end
end
type HogeHoge, :hoge, '() -> Fixnum', typecheck: :later

class Mage
  #include HogeHoge

  type '(Fixnum) -> Fixnum', typecheck: :later
  def mage(num)
    num
  end

  type '() -> Fixnum', typecheck: :later
  def magemage()
    mage(10)
  end

  #type '() -> String', typecheck: :later
  #def mage2()
  #  huga(10) # method_misingのチェックを行う。実際には行ってくれなかった汗   RDLダメじゃね？
  #end

  #type '() -> Fixnum', typecheck: :later
  #def magemagemage()
  #  hoge()
  #end

  type '(Symbol, *%any) -> String'
  def method_missing(name, *_)
    name.to_s
  end
end

Mage.new.mogu

class Huga
  [:huga,:hugahuga].each do |name|
    type self, name, "()->Fixnum"
    define_method name do
      10
    end
  end
end

Huga.new.huga

rdl_do_typecheck :later
