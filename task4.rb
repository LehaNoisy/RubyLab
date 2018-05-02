=begin
 Задание для четвертой домашки: модульнй псевдо-конфигуратор серверов.
 Домашняя работа состоит из 4х файлов помещенных в папку homeworks/kulibin/:
-------------------------------

 - server.rb
   - реализует класс Server
   - у него должна быть константа TYPE == 'base'
   - а так же общие методы всех серверов:
     - #deploy! - который устанавливает name сервера в значение равное "#{ip}-#{type}"
     - #ping - который возвращает true, если cpu сервера четное число, иначе - false
    - так же он определяет нужные attr_readers и attr_writers (на ваше усмотрение)
    - по-умолчанию каждый новый сервис должен создаваться со значением type == TYPE (константе его класса)
    - наличие любых других методов - на ваше усмотрение
-------------------------------

- azure.rb
  - данный файл реализует класс Azure который наследуюется от Server
    - у него своя константа TYPE = 'azure'
    - у него есть метод get_azure_ip! который устанавливает значение ip в фиксированную сроку "azure-1.1.1.1"
    - у него есть метод #deploy! который расширяет оригинальный #deploy!, дополнительно устанавливая значение deployed_by == TYPE (в данном случае 'azure')
    - наличие любых других методов - на ваше усмотрение
  - так же данный файл реализует модуль AzurePlugin у которого есть единственный метод #azure_spawn_server! который устанавливает переданному серверу значение spawned_by == TYPE из класса Azure
-------------------------------

- aws.rb (по-аналогии с azure.rb)
  - данный файл реализует класс Aws который наследуюется от Server
    - у него своя константа TYPE = 'aws'
    - у него есть метод get_aws_ip! который устанавливает значение ip в фиксированную сроку "aws-2.2.2.2"
    - у него есть метод #deploy! который расширяет оригинальный #deploy!, дополнительно устанавливая значение deployed_by == TYPE (в данном случае 'aws')
    - наличие любых других методов - на ваше усмотрение
  - так же данный файл реализует модуль AwsPlugin у которого есть единственный метод #aws_spawn_server! который устанавливает переданному серверу значение spawned_by == TYPE из класса Aws
-------------------------------

- kulibin.rb (Самое интересное)
  - данный файл реализует класс Kulibin
  - его реализация остается на ваше усмотрение :)
  - очевидно, что в нем не должно быть дублирующего функционала из server.rb/azure.rb/aws.rb, но он может использовать их сам

По-итогу у вас должен получиться класс, который я могу использовать слеюдущим образом (помечаю комментариями) в коде:
=end

require_relative 'kulibin'
require_relative 'aws'
require_relative 'azure'

kulibin = Kulibin.setup do |config|
  # задаю api version кулибину
  config.version = 2

  # сохраняю некую конфигурацию сервера, которую могу переиспользовать далее по-имени
  config.define_server :mini do |s|
    s.cpu = 1
    s.ram = 512
    s.ssd = 128
  end

  # аналогично, их может быть много
  config.define_server :high do |s|
    s.cpu = 16
    s.ram = 16384
    s.ssd = 1024
  end

  # описание шагов деплоя, которые в зависимости от сервера могут быть разными
  config.steps :setup do |server|
    case server.type
    when 'aws'
      # методы из Aws
      server.get_aws_ip!
      # методы из AwsPlugin
      config.aws_spawn_server!(server)
    when 'azure'
      # методы из Azure
      server.get_azure_ip!
      # методы из AzurePlugin
      config.azure_spawn_server!(server)
    else
      puts "unknown server type: #{server.type}"
      nil
    end
  end

  # шагов может быть много, выполняться они должны в порядке определения
  config.steps :deploy do |server|
    puts "deploy started"
    # помним, что метод deploy! на каждом из типов серверов свой
    server.deploy!
    puts "deploy finished"
  end

  config.steps :status do |server|
    # а ping общий
    if server.ping
      puts "deploy succeed!. running instance: #{server.name}"
    else
      puts "unable to ping server: #{server.name}"
    end
  end
end
# доступна версия установленная в скрипте
p kulibin.version # => 2

# создаю новый сервер Aws, он пустой, без конфигурации еще, но уже своего типа
aws1 = Aws.new_server
p aws1 # => #<Aws:0x000055a8f52cbca0 @type="aws">

# создаю новый сервер Azure, он пустой, без конфигурации еще, но уже своего типа
azure1 = Azure.new_server
p azure1 # => #<Azure:0x0000557ad7a73530 @type="azure">

# запускаю деплой с конфигураций, описанной ранее в скрипте. выполняются шаги деплоя
kulibin.run :mini, aws1
# deploy started
# deploy finished
# unable to ping server: aws-2.2.2.2-aws

kulibin.run :high, azure1
# deploy started
# deploy finished
# deploy succeed!. running instance: azure-1.1.1.1-azure

# а теперь оба сервера со нужными конфигурациями и свойствами
p aws1 # => 
#<Aws:0x000055a8d2a97218 @type="aws", @cpu=1, @ram=512, @ssd=128, @ip="aws-2.2.2.2", @spawned_by="aws", @name="aws-2.2.2.2-aws", @deployed_by="aws">

p azure1 # => 
#<Azure:0x000055a8d2a96f70 @type="azure", @cpu=16, @ram=16384, @ssd=1024, @ip="azure-1.1.1.1", @spawned_by="azure", @name="azure-1.1.1.1-azure", @deployed_by="azure">



# тесты добавлю позже.
# Творческих выходных! :D
