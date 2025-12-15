; Этап 5: Тестовая задача - Пример 2
; Применение bitreverse() к вектору из 10 элементов
; Результат записывается в исходный вектор

; Инициализация вектора по адресу 100
; Вектор: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
; Простые последовательные числа

; Элемент 0: 10
LOAD_CONST 10
LOAD_CONST 100
WRITE_MEM

; Элемент 1: 20
LOAD_CONST 20
LOAD_CONST 101
WRITE_MEM

; Элемент 2: 30
LOAD_CONST 30
LOAD_CONST 102
WRITE_MEM

; Элемент 3: 40
LOAD_CONST 40
LOAD_CONST 103
WRITE_MEM

; Элемент 4: 50
LOAD_CONST 50
LOAD_CONST 104
WRITE_MEM

; Элемент 5: 60
LOAD_CONST 60
LOAD_CONST 105
WRITE_MEM

; Элемент 6: 70
LOAD_CONST 70
LOAD_CONST 106
WRITE_MEM

; Элемент 7: 80
LOAD_CONST 80
LOAD_CONST 107
WRITE_MEM

; Элемент 8: 90
LOAD_CONST 90
LOAD_CONST 108
WRITE_MEM

; Элемент 9: 100
LOAD_CONST 100
LOAD_CONST 109
WRITE_MEM

; Применение bitreverse() к каждому элементу вектора
; Результат записывается обратно в исходный вектор (in-place)

; Обработка элемента 0 (адрес 100)
LOAD_CONST 100
READ_MEM 0
LOAD_CONST 100
BITREVERSE 0

; Обработка элемента 1 (адрес 101)
LOAD_CONST 101
READ_MEM 0
LOAD_CONST 101
BITREVERSE 0

; Обработка элемента 2 (адрес 102)
LOAD_CONST 102
READ_MEM 0
LOAD_CONST 102
BITREVERSE 0

; Обработка элемента 3 (адрес 103)
LOAD_CONST 103
READ_MEM 0
LOAD_CONST 103
BITREVERSE 0

; Обработка элемента 4 (адрес 104)
LOAD_CONST 104
READ_MEM 0
LOAD_CONST 104
BITREVERSE 0

; Обработка элемента 5 (адрес 105)
LOAD_CONST 105
READ_MEM 0
LOAD_CONST 105
BITREVERSE 0

; Обработка элемента 6 (адрес 106)
LOAD_CONST 106
READ_MEM 0
LOAD_CONST 106
BITREVERSE 0

; Обработка элемента 7 (адрес 107)
LOAD_CONST 107
READ_MEM 0
LOAD_CONST 107
BITREVERSE 0

; Обработка элемента 8 (адрес 108)
LOAD_CONST 108
READ_MEM 0
LOAD_CONST 108
BITREVERSE 0

; Обработка элемента 9 (адрес 109)
LOAD_CONST 109
READ_MEM 0
LOAD_CONST 109
BITREVERSE 0
