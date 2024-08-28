26 August 2024

## Anatomy of COBOL

- Column dependent language - needs to be aligned past col 7
- Cols 1-6 are never used
- Col 7 uses asterisk for comment lines
- *> sometimes needed to fix the code
- Cols 8-11 (Area A) is where compiler looks for the four divisions
- Cols 12-72 (Area B) is the executable statements

## User defined names
- a-z, 0-9, and dashes
- no embedded spaces
- 2-30 chars, don't start with number

## The Four Divisions of COBOL

1. Identification Division
    - Identifies the program using ``program id. <user-defined name>``
    - Program names must be alphanumeric (and dashes), have at least one alpha, and cannot be a reserved word
    - Maximum length of 30 characters
2. Environment Division
    - Used for input/output files and such
3. Data Division
    - Declaring and defining data items (variables)
4. Procedure Division
    - Executable statements and commands
    - Organised into paragraphs
    - Paragraphs allow for modules (or functions) to be used multiple times in the procedures

## Types of Errors
    - Syntax error: typos, misusing reserved word, etc. breaking rules of the language
    - Runtime/Execution error: (ex divide by 0, open non-existent file) - syntax correct, but not possible to do
    - Logic error: when output comes in unexpected form, generally issue with the programmer's logic

## Other Points of Note
`` stop run.`` is needed to end program.

All lines must end with a period

Executable statements must line up in col 12, other code starts in col 8.

Don't use reserved words as user defined names (blue on instructor's system)
