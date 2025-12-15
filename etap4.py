import argparse
import sys
import csv
class VirtualMachine:
    def __init__(self, memory_size=1024):
        self.memory = [0] * memory_size
        self.stack = []
        self.pc = 0
        self.program_bytes = bytearray()
    def load_program(self, binary_file):
        try:
            with open(binary_file, 'rb') as f:
                self.program_bytes = bytearray(f.read())
            print(f"Программа загружена: {len(self.program_bytes)} байт")
        except Exception as e:
            raise Exception(f"Ошибка при загрузке программы: {e}")
    def decode_instruction(self):
        if self.pc >= len(self.program_bytes):
            return None
        first_byte = self.program_bytes[self.pc]
        opcode = first_byte & 0x3F
        if opcode == 7:  # LOAD_CONST
            if self.pc + 5 > len(self.program_bytes):
                raise Exception(f"Недостаточно байт для LOAD_CONST на позиции {self.pc}")
            value = 0
            for i in range(5):
                value |= self.program_bytes[self.pc + i] << (i * 8)
            b_value = (value >> 6) & 0x7FFFFFFFF
            return {'opcode': 7, 'type': 'LOAD_CONST', 'b_value': b_value, 'size': 5}
        elif opcode == 61:  # READ_MEM
            if self.pc + 2 > len(self.program_bytes):
                raise Exception(f"Недостаточно байт для READ_MEM на позиции {self.pc}")
            value = self.program_bytes[self.pc] | (self.program_bytes[self.pc + 1] << 8)
            b_value = (value >> 6) & 0x3FF
            return {'opcode': 61, 'type': 'READ_MEM', 'b_value': b_value, 'size': 2}
        elif opcode == 27:  # WRITE_MEM
            return {'opcode': 27, 'type': 'WRITE_MEM', 'size': 1}
        elif opcode == 25:  # BITREVERSE
            if self.pc + 2 > len(self.program_bytes):
                raise Exception(f"Недостаточно байт для BITREVERSE на позиции {self.pc}")
            value = self.program_bytes[self.pc] | (self.program_bytes[self.pc + 1] << 8)
            b_value = (value >> 6) & 0x3FF
            return {'opcode': 25, 'type': 'BITREVERSE', 'b_value': b_value, 'size': 2}
        else:
            raise Exception(f"Неизвестный опкод: {opcode} на позиции {self.pc}")
    def execute_instruction(self, instr):
        instr_type = instr['type']
        if instr_type == 'LOAD_CONST':
            self.stack.append(instr['b_value'])
            print(f"  LOAD_CONST {instr['b_value']} -> stack")
        elif instr_type == 'READ_MEM':
            if len(self.stack) < 1:
                raise Exception("READ_MEM: недостаточно элементов в стеке")
            address = self.stack.pop()
            offset = instr['b_value']
            final_address = address + offset
            if final_address < 0 or final_address >= len(self.memory):
                raise Exception(f"READ_MEM: адрес {final_address} вне диапазона памяти")
            value = self.memory[final_address]
            self.stack.append(value)
            print(f"  READ_MEM [address={address}, offset={offset}] -> memory[{final_address}] = {value}")
        elif instr_type == 'WRITE_MEM':
            if len(self.stack) < 2:
                raise Exception("WRITE_MEM: недостаточно элементов в стеке")
            address = self.stack.pop()
            value = self.stack.pop()
            if address < 0 or address >= len(self.memory):
                raise Exception(f"WRITE_MEM: адрес {address} вне диапазона памяти")
            self.memory[address] = value
            print(f"  WRITE_MEM memory[{address}] = {value}")
        elif instr_type == 'BITREVERSE':
            if len(self.stack) < 2:
                raise Exception("BITREVERSE: недостаточно элементов в стеке")
            address_base = self.stack.pop()
            value = self.stack.pop()
            offset = instr['b_value']
            final_address = address_base + offset
            if final_address < 0 or final_address >= len(self.memory):
                raise Exception(f"BITREVERSE: адрес {final_address} вне диапазона памяти")
            reversed_value = self.bitreverse(value)
            self.memory[final_address] = reversed_value
            print(f"  BITREVERSE value={value} -> {reversed_value}, memory[{final_address}] = {reversed_value}")
        self.pc += instr['size']
    def bitreverse(self, value, bits=32):
        result = 0
        for i in range(bits):
            if value & (1 << i):
                result |= 1 << (bits - 1 - i)
        return result
    def run(self):
        print("\n=== Начало выполнения программы ===\n")
        instruction_count = 0
        while self.pc < len(self.program_bytes):
            print(f"[PC={self.pc}]", end=" ")
            instr = self.decode_instruction()
            if instr is None:
                break
            self.execute_instruction(instr)
            instruction_count += 1
        print(f"\n=== Выполнение завершено ===")
        print(f"Всего выполнено команд: {instruction_count}")
        print(f"Состояние стека: {self.stack}")
    def dump_memory(self, output_file, start_addr, end_addr):
        try:
            if start_addr < 0:
                start_addr = 0
            if end_addr >= len(self.memory):
                end_addr = len(self.memory) - 1
            with open(output_file, 'w', newline='', encoding='utf-8') as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow(['Address', 'Value'])
                for addr in range(start_addr, end_addr + 1):
                    writer.writerow([addr, self.memory[addr]])
            print(f"\nДамп памяти сохранен в файл: {output_file}")
            print(f"Диапазон адресов: {start_addr} - {end_addr}")
        except Exception as e:
            raise Exception(f"Ошибка при сохранении дампа памяти: {e}")
def main():
    parser = argparse.ArgumentParser(description="Интерпретатор для УВМ (Этап 3)")
    parser.add_argument('binary_file', type=str, help="Путь к бинарному файлу с программой")
    parser.add_argument('-o', '--output', type=str, default='memory_dump.csv', 
                        help="Путь к файлу для дампа памяти (CSV)")
    parser.add_argument('-r', '--range', type=str, default='0-100',
                        help="Диапазон адресов памяти для дампа (например, 0-100)")
    parser.add_argument('-m', '--memory-size', type=int, default=1024,
                        help="Размер памяти (по умолчанию 1024)")
    args = parser.parse_args()
    try:
        range_parts = args.range.split('-')
        if len(range_parts) != 2:
            raise ValueError("Диапазон должен быть в формате START-END (например, 0-100)")
        start_addr = int(range_parts[0])
        end_addr = int(range_parts[1])
        vm = VirtualMachine(memory_size=args.memory_size)
        vm.load_program(args.binary_file)
        vm.run()
        vm.dump_memory(args.output, start_addr, end_addr)
    except Exception as e:
        print(f"Ошибка: {e}", file=sys.stderr)
        sys.exit(1)
if __name__ == "__main__":
    main()
