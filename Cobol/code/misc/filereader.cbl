       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILEREADER.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
              SELECT INFILE ASSIGN TO 'customer-20.txt'
              ORGANIZATION IS SEQUENTIAL.
          
       DATA DIVISION.
       FILE SECTION.
       
       FD INFILE.
       01 XINPUT.
              05 NCUSTNUMIN        PIC 9(5).
              05 XLASTNAME         PIC X(25).
              05 XFIRSTNAME        PIC X(20).
              05 NYEAR             PIC 9(4).
              05 NMONTH            PIC 99.
              05 NDAY              PIC 99.
              05 NBALANCE          PIC 9(5)v99.
       
       WORKING-STORAGE SECTION.
              77 XEOF       PIC X        VALUE 'N'.
              77 NCOUNTER   PIC 999      VALUE 0.
              77 NTOTALBAL  PIC 9(6)v99  VALUE 0.
              
              01 XOUTPUT.
                     05 NCUSTNUMOUT      PIC 9(5).
                     05 FILLER           PIC XX     VALUE SPACES.
                     05 XNAME            PIC X(35).
                     05 FILLER           PIC XX     VALUE SPACES.
                     05 XDATE            PIC X(10).
                     05 FILLER           PIC XX     VALUE SPACES.
                     05 NEBALANCE        PIC $$$,$$9.99.
              01 XFOOTER.
                     05 NECOUNTER         PIC ZZZZ9.
                     05 FILLER           PIC X(51)  VALUE "  CUSTOMERS".
                     05 NETOTALBALANCE   PIC $$$,$$9.99.
                     
       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM 100-INIT.
           PERFORM 200-LOOP UNTIL XEOF = 'Y'.
           PERFORM 300-TERMINATE.
           STOP RUN.
           
       100-INIT.
           OPEN INPUT INFILE.
       
       200-LOOP.
           READ INFILE
              AT END
                 MOVE 'Y' TO XEOF,
              NOT AT END
                 PERFORM 210-PROC,
           END-READ.
       
       210-PROC.
            MOVE NCUSTNUMIN TO NCUSTNUMOUT.
            MOVE FUNCTION CONCATENATE (FUNCTION TRIM(XLASTNAME), ", ",
              XFIRSTNAME) TO XNAME.
            MOVE FUNCTION CONCATENATE(NMONTH, "/", NDAY, "/", NYEAR)
              TO XDATE.
            MOVE NBALANCE TO NEBALANCE.
            DISPLAY XOUTPUT.
            COMPUTE NCOUNTER = NCOUNTER + 1.
            ADD NBALANCE TO NTOTALBAL.
            
       300-TERMINATE.
            CLOSE INFILE.
            MOVE NCOUNTER TO NECOUNTER.
            MOVE NTOTALBAL TO NETOTALBALANCE.
            DISPLAY " ".
            DISPLAY XFOOTER.
       