; Тестовая программа для копирования массива
; Копирует массив из 5 элементов с адреса 100 на адрес 200

; Инициализация исходного массива (записываем данные по адресам 100-104)
LOAD_CONST 10
LOAD_CONST 100
WRITE_MEM

LOAD_CONST 20
LOAD_CONST 101
WRITE_MEM

LOAD_CONST 30
LOAD_CONST 102
WRITE_MEM

LOAD_CONST 40
LOAD_CONST 103
WRITE_MEM

LOAD_CONST 50
LOAD_CONST 104
WRITE_MEM

; Копирование элемента 1: memory[100] -> memory[200]
LOAD_CONST 100
READ_MEM 0
LOAD_CONST 200
WRITE_MEM

; Копирование элемента 2: memory[101] -> memory[201]
LOAD_CONST 101
READ_MEM 0
LOAD_CONST 201
WRITE_MEM

; Копирование элемента 3: memory[102] -> memory[202]
LOAD_CONST 102
READ_MEM 0
LOAD_CONST 202
WRITE_MEM

; Копирование элемента 4: memory[103] -> memory[203]
LOAD_CONST 103
READ_MEM 0
LOAD_CONST 203
WRITE_MEM

; Копирование элемента 5: memory[104] -> memory[204]
LOAD_CONST 104
READ_MEM 0
LOAD_CONST 204
WRITE_MEM
