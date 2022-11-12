# Comp-Arc-HW2

<br> Вариант 18.
<br> Работа выполнена Татауровым Матвеем, БПИ 217 на оценку 6.
<br> Букву Y считаю гласной. В любом случае, на решении задачи это не скажется)

## На 4 балла:
 ### 1. Приведено решение задачи на С:
   > * [main.c](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/c_files/main.c)
   > * [changestring.c](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/c_files/changesring.c)
   
### 2. Программа проассемблирована и откомпилирована без оптимизирующих опций, в коде программы прокомментированы переменные:
   > * [main.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly/main.s)
   > * [changestring.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly/changestring.s)
    
   ### <br> Вот файлик со всеми переменными для удобства:
   > * [Переменные](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Other_files/Variables.md)
   
### 3. Программа промодифицирована флагами компиляции, затем изменена вручную:
   > * [main_mod.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly_mod/main_mod.s)
   > * [changestring_mod.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly_mod/changestring_mod.s)
   ### Файл изменений:
   > * [Список изменений](https://github.com/KcasTischaWattt/Comp-Arc-HW1/blob/main/md-files/changes1.md)
 
 ### 4. Проведено тестирование, результаты указаны в [документе](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Other_files/Tests.md).
## На 5 баллов:
 ### 1. В приведённом выше решении задачи на C используются локальные переменные, такие как flag и max_size, а так же 1 функция void change_string(char *str) с 1 параметром.
   > * [main.c](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/c_files/main.c)
   > * [changestring.c](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/c_files/changesring.c)
 ### 2. В ассемблерный код были добавлены комментарии, поясняющие передачу параметров в метод, а так же связь параметров метода с регистрами.
   > * [main_mod.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly_mod/main_mod.s)
   > * [changestring_mod.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly_mod/changestring_mod.s)
## На 6 баллов:
### 1.Рефакторинг программы за счет максимального использования регистров процессора:
Были реализованы все увиденные возможные замены локальных переменных на регистры процессора:

<br>r12d вместо итераторов i в for
<br>r13d вместо итераторов j в for
<br>flag заменён на r14d
<br>max_size заменён на r15d

   > * [main_mod.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly_mod/main_mod.s)
   > * [changestring_mod.s](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Assembly_mod/changestring_mod.s)
### 2. Проведено тестирование, результаты указаны в [документе](https://github.com/KcasTischaWattt/Comp-Arc-HW2/blob/main/Other_files/Tests.md).

### 3. Так как замеров времени данной оценкой не предусмотрено, я могу лишь сравнить размеры исполняемых файлов и количество строк.
Размер исполняемого файла:
>  Программа на С:
>  Ассемблерная программа без модификаций:
>  Финальная ассемблерная программа с модификациями:

