23 September 2024

## Multiple Input Files

- If inFile isn't defined correctly, then everything breaks

- Three requirements for accessing external files:
1. SELECT statement in Environment Division
2. fd paragraph in Data Division
3. Associated Record Desc in Data Division

``Organization is line sequential.`` means one record per line

`` value`` sets an initial value before compile time

``open input xInput`` and ``open output xOutput``

``before advancing 1 line.`` does a carriage return iirc

``trim`` removes any extra spaces from pic clause which was overzealous

- internal file name is the nickname for a file
- ``fd`` stands for file description
- associated record description describes record format
- We use the smaller/filter file first

- Want to save to multiple variables at once?
- `` compute nGrossPay, neGrossPay = calc`` or ``move to neGross,nGross``
- 
