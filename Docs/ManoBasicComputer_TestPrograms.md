# **Mano Basic Computer Test Programs**

## **1. Add and Store**

### **Description**

Loads a value, increments it, and stores the result.

### **Program**

```assembly
000: LDA 100     | Load value                 | Binary: 0010 0001 0000 0000 | Hex: 2100
001: INC         | Increment AC               | Binary: 0111 0000 0010 0000 | Hex: 7020
002: STA 101     | Store result               | Binary: 0011 0001 0000 0001 | Hex: 3101
100: 0005        | Initial value              | Binary: 0000 0000 0000 0101 | Hex: 0005
```

### **Result**

- `AC = 0006`
- `M[101] = 0006`
- `PC = 003`

---

## **2. Basic Logical Input and Conditional Execution**

### **Description**

Demonstrates reading input, adds value, clears flag, and conditionally skips.


### **Program**

```assembly
000: INP         | Input data from INPR       | Binary: 1111 1000 0000 0000 | Hex: F800
001: ADD 100     | AND with another operand   | Binary: 0001 0001 0000 0000 | Hex: 1100
002: CLE         | Clear E-Flag               | Binary: 0111 0100 0000 0000 | Hex: 7400
003: SZA         | Skip if AC is zero         | Binary: 0111 0000 0000 0100 | Hex: 7004
100: FFFF        | First value                | Binary: 1111 1111 1111 1111 | Hex: FFFF
```

### **Result**

- `AC = 0000` 
- `PC = 005` (skip next instruction)

---

## **3. Subroutine Call with BSA**

### **Description**

Tests BSA (Branch and Save Address) instruction for subroutine calls along with a circular shift.

### **Program**

```assembly
000: LDA 100     | Load value                 | Binary: 0010 0001 0000 0000 | Hex: 2100
001: BSA 003     | Call subroutine at 003     | Binary: 0101 0000 0000 0011 | Hex: 5003
002: STA 101     | Store result               | Binary: 0011 0001 0000 0001 | Hex: 3101
003: 0000        | Return address storage     | Binary: 0000 0000 0000 0000 | Hex: 0000
004: CIL         | Circular shift left        | Binary: 0111 0000 0100 0000 | Hex: 7040
005: BUN 003 I   | Indirect Return to caller  | Binary: 1100 0000 0000 0011 | Hex: C003
100: 4000        | Initial value              | Binary: 0100 0000 0000 0000 | Hex: 4000
101: 0000        | Result location            | Binary: 0000 0000 0000 0000 | Hex: 0000
```

### **Result**

- `M[003] = 0002` (Return address saved by BSA)
- `AC = 8000` (After circular left shift of 4000)
- `M[101] = 8000`
- `PC = 003`
