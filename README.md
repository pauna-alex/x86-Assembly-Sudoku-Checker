# Sudoku Validity Checker (x86 Assembly)

This project implements a validity checker for a standard $9\times9$ Sudoku board using x86 Assembly. Designed as a low-level verification tool, it analyzes a given board state to ensure it adheres to the classic rules of the game using an efficient mathematical approach.

## 🎯 Objective

The main goal is to implement three essential assembly functions that validate different constraints of the Sudoku grid:

- **`check_row`**: Verifies that the digits 1-9 appear exactly once in a specified row.
- **`check_column`**: Verifies that the digits 1-9 appear exactly once in a specified column.
- **`check_box`**: Verifies that the digits 1-9 appear exactly once in a specific $3\times3$ subgrid (box).

## ⚙️ Technical Details

- **Input Representation**: The Sudoku board is received as a flat, 81-element character array (`char*`), where the grid is flattened row by row.
- **Indexing**: Rows, columns, and boxes are identified by an integer index ranging from `0` to `8`.
- **Return Values**: The functions return the validation result directly in the `eax` register:
  - `1`: The checked section is **CORRECT**.
  - `2`: The checked section is **WRONG**.

## 🚀 Algorithm & Implementation Logic

Instead of using complex frequency arrays or nested loops to check for duplicates, this solution utilizes a mathematical property of the unique set of digits `{1, 2, ..., 9}`. For every target row, column, or box, the algorithm computes two values:

1. **The Sum**: It calculates the arithmetic sum of all elements in the section.
   - **Target Value**: **45** (since $1 + 2 + ... + 9 = 45$).

2. **The Product**: It calculates the product of all elements in the section.
   - **Target Value**: **362,880** (since $1 \times 2 \times ... \times 9 = 9! = 362,880$).

### Validation Logic
A section is considered valid **if and only if** the calculated sum equals `45` **AND** the calculated product equals `362,880`. This ensures that the section contains exactly the digits 1 through 9 with no duplicates and no missing values.
