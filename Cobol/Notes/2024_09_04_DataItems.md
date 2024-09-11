04 September 2024

## Declaring Data Items

-  They're not variables, they're "data items"
-  Variables must be declared in the ``DATA DIVISION`` prior to usage
-  Place independent variables in the ``WORKING-STORAGE SECTION`` - don't interact with a heirarchy of data items
-  Must obey the restrictions on user-defined names
-  3 types: Numeric, Numeric edited (used for output), and Alphanumeric
-  Level 77 - independent variables

| **Data Type** | **Purpose** | **Characters** | Prefix |
|-----------|---------|------------|--|
| Alphanumeric | strings | x | x |
| Numeric | input/calculations | 9 s (implied sign) v (implied decimal) | n |
| Numeric-Edited | output | 9 +-, .(real decimal) $ z (supress zero) | ne |

### Numeric Edited Formatting Options

| **Type** | **PIC Clause** |
|-|-|
|neDecimalPoint|``pic 99999.99``|
|neCommaInsertion|``pic 99,999.99``|
|neZeroSuppression|``pic zz.zz9.99``|
|neFloatingDollarSign|``pic $$$,$$9.99``|
|neCheckProtection|``pic ***,**9.99``|
|neFloatingPlusSign|``pic +++,++9.99``|
|neRightPlusSign|``pic zzz,zz9.99+``|
|neFloatingMinusSign|``pic ---,--9.99``|
|neRightMinusSign|``pic zzz,zz9.99-``|
|neDB|``pic zz,zz9.99DB``|
|neCR|``pic zz,zz9.99CR``|

### PIC Clauses
- Used to define data types and maximum size
- 'v' is an implied decimal point in numeric PIC item
- 's' is used for pos/neg sign on a numeric
- 'z' is zero-suppression in a numeric-edited

## Class Naming Conventions
- Name each variable logically
- Use data-type prefix (n, ne, x, g, etc.)
- 'n' for numeric, 'ne' for numeric-edited, and '

## Other formatting options
- ``77 neChequeProtection ***,**9.99.`` to hide/obscure some chars
- Move retains value, simply copies to another variable
