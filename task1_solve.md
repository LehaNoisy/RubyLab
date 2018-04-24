### Домашнее задание: 1
#### Теория:
- прочесть заметки лекции ещё раз, два, три...
- изучить следующие ссылки:
  - информация о числах https://ru.wikibooks.org/wiki/Ruby/%D0%9F%D0%BE%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%B5%D0%B5_%D0%BE_%D1%87%D0%B8%D1%81%D0%BB%D0%B0%D1%85
  - информация о строках https://ru.wikibooks.org/wiki/Ruby/%D0%9F%D0%BE%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%B5%D0%B5_%D0%BE_%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B0%D1%85

- Осмотреться в документации:
	- https://ruby-doc.org/core-2.5.0/Integer.html
  - http://ruby-doc.org/core-2.5.0/Float.html
  - http://www.ruby-doc.org/core-2.5.0/String.html
  - http://www.ruby-doc.org/core-2.5.0/Symbol.html
- составить список вопросов
- выделить одну интересную и запомнившуюся особенность/метод/факт связанный с `Ruby`


#### Практика:

### `Ruby`: руководство по стилю оформления, код скриптов должен с большего им соответствовать
- https://github.com/arbox/ruby-style-guide/blob/master/README-ruRU.md -
по-русски
- https://github.com/styleguide/ruby
- https://github.com/airbnb/ruby

- установить `Ruby 2.5.1` через `RVM`
- создать новый `gemset mtn`, сделать его дефолтным при заходе в shell
- установить в нем библиотеки-гемы `bundler`, `pry`, `sqlite3`
- __\*\*\*__ поиграть в игру-курс
https://tryruby.org/levels/1/challenges/0

1. на вход (читать "в переменной") подаётся текст вида:

```bash
10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
```

Вывести на экран:
- полный текст строки с ошибкой (наличие подстроки "error" в любом регистре)
- для каждой строки (без ошибки) вывести соответствующую ей комбинацию вида: "datetime from: ip_address to: endpoint_path(в большом регистре)"
  например, для примера выше первым выводом будет: "23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /GRID/2/MESSAGES"

2. на вход (читать "в переменной") подаётся текст вида:

```bash
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
```

Вывести на экран длительность действия в СЕКУНДАХ между событиями, произошедшими в момент "Calling core with action: <%whatever%)".
Между ними может сколько угодно других событий.
Для данного примера вывод будет: (2018-04-23 17:18:38.8 - 2018-04-23 17:17:49.7) = (38.8 + 10.3) = "49.1" <- только это число

3. Дана произвольная строка, в которой есть буквы, цифры, кони, лоси..
Вывести на экран сумму всех цифр из данной строки. (вещественные числа, типа 3.14 рассматриваются как 3 числа)

Домашку присылать по адресу: `aliaksandr_buhayeu@epam.com` с темой письма: `MTN_APR_18:L_1:NAME_SURNAME`.
У меня фильтр на письма, кто не справится с темой - домашку не проверю :smile:

> Домашка - это **ОДИН** исполняемый `Ruby`-скрипт, в котором решения задачек разделены каким-нибудь коментарием / описанием задачи.

> Называйте ваш скрипт: `name_surname_l1.rb`.  
Спасибо!

##### На этом всё, жду вас на следующем занятии!







##################################################
Install gemset mtn:
rvm gemset create mtn
rvm gemset use mtn --default

















