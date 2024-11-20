20 November 2024

# Other file organisations:

- Sequential: Same chars in each data item, each row is a record  Avg record to process when searching: n/2
- Indexed: Seperate file stores indexes of each records avg record to process: sqrt(n)
- Relative: Each record is 65 bytes of space, customer 44 would be after 43*65 bytes of empty spaces  avg record process: 1


 | Organisation | Description | Average Records to Process When Searching |
| -------- | ------- | ------- |
| Sequential | 1 record per row, each data item stored in the same number of spaces per col |n/2 |
| Indexed | Uses a separate file storing a primary key for each record which can be used to find a record in the main data file | sqrt(n) |
| Relative | Each record is 65 bytes of space, any values not defined are just 65 bytes of empty space |1 |

- Random access mode allows for entering an input file at any point
- Relative Key - primary key for relative file searching, used for guessing location within the records

Sample relative select statement:
```
select OutFile assign to 'RelativeCustomers.fil'
  organization is relative,
  access mode is random,
  relative key is nNumber.
```
- A blank screen from a cgi means that there's an issue with the program
- For relative files, ensure the file exists prior to execution
- Relative files are often larger than sequential files - we trade off storage efficiency for execution efficiency
- ``not invalid key`` clause used when key is valid
