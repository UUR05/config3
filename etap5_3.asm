; Этап 5: Тестовая задача - Пример 3
; Применение bitreverse() к вектору из 10 элементов
; Результат записывается в исходный вектор

; Инициализация вектора по адресу 100
; Вектор: [255, 15, 240, 3, 192, 63, 0, 4095, 1023, 65535]
; Различные битовые маски для демонстрации разворота битов

; Элемент 0: 255 (0xFF)
LOAD_CONST 255
LOAD_CONST 100
WRITE_MEM

; Элемент 1: 15 (0x0F)
LOAD_CONST 15
LOAD_CONST 101
WRITE_MEM

; Элемент 2: 240 (0xF0)
LOAD_CONST 240
LOAD_CONST 102
WRITE_MEM

; Элемент 3: 3 (0x03)
LOAD_CONST 3
LOAD_CONST 103
WRITE_MEM

; Элемент 4: 192 (0xC0)
LOAD_CONST 192
LOAD_CONST 104
WRITE_MEM

; Элемент 5: 63 (0x3F)
LOAD_CONST 63
LOAD_CONST 105
WRITE_MEM

; Элемент 6: 0 (0x00)
LOAD_CONST 0
LOAD_CONST 106
WRITE_MEM

; Элемент 7: 4095 (0xFFF)
LOAD_CONST 4095
LOAD_CONST 107
WRITE_MEM

; Элемент 8: 1023 (0x3FF)
LOAD_CONST 1023
LOAD_CONST 108
WRITE_MEM

; Элемент 9: 65535 (0xFFFF)
LOAD_CONST 65535
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
