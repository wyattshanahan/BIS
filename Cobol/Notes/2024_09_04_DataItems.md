04 September 2024

## Declaring Data Items

-  They're not variables, they're "data items"
-  Variables must be declared in the ``DATA DIVISION`` prior to usage
-  Place independent variables in the ``WORKING-STORAGE SECTION`` - don't interact with a heirarchy of data items
-  Must obey the restrictions on user-defined names
-  3 types: Numeric, Numeric edited (used for output), and Alphanumeric
-  Level 77 - independent variables

### PIC Clauses
- Used to define data types and maximum size
- 'v' is an implied decimal point in numeric PIC item
- 's' is used for pos/neg sign on a numeric
- 'z' is zero-suppression in a numeric-edited

## Class Naming Conventions
- Name each variable logically
- Use data-type prefix (n, ne, x, g, etc.)
