# create_classメソッドは、動的に新しいクラスを作成し、そのクラスに初期化メソッドを定義します。このメソッドは2つの引数を取ります：作成するクラスの名前と初期化メソッドの名前です。

# まず、Class.newを使用して無名の新しいクラスを作成します。この新しいクラスの中で、define_methodを使用して初期化メソッドを定義します。この初期化メソッドは任意の数の引数を取り、それらをインスタンス変数@argsに保存します。

# 次に、同じくdefine_methodを使用してget_argsメソッドを定義します。このメソッドは@argsを返します。

# 最後に、Object.const_setを使用して新しいクラスに名前を付け、それを定数として設定します。これにより、その名前で新しいクラスを参照できるようになります。

# このメソッドを使用してDynamicClassという名前の新しいクラスを作成し、その初期化メソッドをinitializeと名付けています。その後、この新しいクラスのインスタンスを作成し、get_argsメソッドを使用して初期化時に渡された引数を取得しています。
def create_class(class_name, initialize_method)
  new_class = Class.new do
    define_method(initialize_method) do |*args|
      @args = args
    end
    define_method(:get_args) do
      @args
    end
  end
  Object.const_set(class_name, new_class)
end

create_class("DynamicClass", "initialize")

obj = DynamicClass.new("arg1", "arg2")

puts obj.get_args.inspect


class String
  def custom_reverse
    "Reversed: #{reverse}"
  end
end

puts "Hello Ruby!".custom_reverse


# DSLBuilderは、Domain Specific Language (DSL) の構築を助けるクラスです。DSLは特定の問題領域に特化したプログラミング言語で、その領域の問題を効率的に解決するために設計されます。

# このDSLBuilderクラスでは、commandメソッドを使用してDSLのコマンドを定義し、execute_commandsメソッドを使用してそれらのコマンドを実行します。

# commandメソッドは、コマンドの名前とその実行時の動作（ブロック）を受け取り、それらを@commands配列に保存します。この配列は、コマンドの名前とブロックを含むハッシュの集合です。

# execute_commandsメソッドは、@commands配列の各コマンドを順に実行します。各コマンドの名前を出力した後、instance_evalを使用してコマンドのブロックを実行します。instance_evalは、ブロックをレシーバのコンテキストで実行するメソッドで、この場合はDSLBuilderのインスタンスです。

# このクラスを使用することで、DSLのコマンドを簡単に定義し、それらを実行することができます。
class DSLBuilder
  def initialize
    @commands = []
  end

  def command(name, &block)
    @commands << {name: name, block: block}
  end

  def execute_commands
    @commands.each do |command|
      puts "Executing command '#{command[:name]}'"
      instance_eval(&command[:block])
    end
  end
end

dsl = DSLBuilder.new

dsl.command :greet do
  puts "Hello, World!"
end

dsl.command :add_numbers do
  result = 3 + 5
  puts "The sum is #{result}"
end

dsl.execute_commands
