# Конвейер для сборки программы App

## Описание

Данный конвейер осуществляет сборку примитивной программы C++ с использованием зависимости "fmt", загружаемой при помощи пакетного менеджера Conan.

## Реализация программы

После успешной сбоки бинарный файл выводит сообщение "Hello from FMT v100201!". Вывод программы требует наличия библиотеки "fmt", что подтверждает выполнение поставленного задания.

Конвейер не требует от пользователя знаний настройки bash-скриптов при запуске на **Debian-дистрибутивах**. Скрипт производит проверку установки пакетов, необходимых для сборки проекта.

Также скрипт создаёт виртуальное окружение venv и производит установку Conan в это окружение.

## Инструкция по использованию

### На GNU\Linux Debian и производных от него дистрибутивах

1. Распакуйте содержимое архива conanbuild.zip в директорию сборки.
2. Запустите команду:

```bash
   chmod u+x ./build.sh && ./build.sh
```

После завершения сборки запустите программу:

```bash
./build/Release/app
```

В случае успешной сборки программы вывод будет следующим:

```bash
foo@bar:~$ ./bin/Release/app
Hello from FMT v100201!
```

### На других дистрибутивах

1. Распакуйте содержимое архива conanbuild.zip в директорию сборки
2. Установите g++, Cmake, Python 3 пакетным менеджером дистрибутива
3. Создайте виртуальную среду для Python в директории с распакованными файлами и установите в неё Conan:

   ```bash
   python3 -m venv .venv
   pip install conan
   ```
4. Создайте и перейдите в директорию build:

   ```bash
   mkdir -p build && cd build
   ```
5. Установите зависимости, указанные в conanfile:

   ```bash
   conan install .. --build=missing
   ```
6. Соберите проект:

   ```bash
   conan build ..
   ```

После завершения сборки запустите программу:

```bash
./build/Release/app
```

В случае успешной сборки программы вывод будет следующим:

```bash
foo@bar:~$ ./bin/Release/app
Hello from FMT v100201!
```

## Автор

Алексадр Роджерс, `a.rodzhers51@mail.ru`
