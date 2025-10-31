# VHDL Adder/Subtracter

This project implements a **16-bit Adder/Subtracter** in VHDL.  
The design supports multiple operations, including addition and subtraction, with carry-in and overflow detection.

---

## Entity: Adder_Subtracter

### Ports

| Port  | Direction | Description |
|-------|-----------|-------------|
| A     | input     | 16-bit signed input |
| B     | input     | 16-bit signed input |
| Func  | input     | 2-bit operation selector |
| Cin   | input     | Carry-in bit |
| R     | output    | 16-bit signed result |
| Cout  | output    | Carry-out bit |
| O_F   | output    | Overflow flag |

---

## Functionality

The `Func` input selects the operation:

| Func | Operation                  |
|------|---------------------------|
| "00" | Add A + B                 |
| "01" | Add A + B + Cin           |
| "10" | Add A + NOT B + 1         |
| "11" | Add A + NOT B + Cin       |

The output `R` gives the 16-bit result, `Cout` is the carry-out, and `O_F` indicates overflow.

---

## Architecture

- Behavioral architecture is used.  
- Signal `B_in` is selected based on `Func`.  
- 17-bit temporary `sum` is used to calculate carry and overflow.  
- Overflow is detected as XOR of the MSB of sum and result.

---

## Example Usage

Instantiate the Adder_Subtracter in a testbench and apply test vectors to `A`, `B`, `Func`, and `Cin` to observe `R`, `Cout`, and `O_F`.

---

## Author
**Kimia Sadeghati**
