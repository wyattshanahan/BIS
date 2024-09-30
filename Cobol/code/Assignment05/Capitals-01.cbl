       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAPITALS-01. *> CAPITALS TABLE
       AUTHOR. WYATT SHANAHAN.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
           SELECT INFILE ASSIGN TO 'Capitals.txt'
             ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTFILE ASSIGN TO 'Payroll.rpt'
             ORGANIZATION IS LINE SEQUENTIAL.
             
       DATA DIVISION.
       FILE SECTION.
       
       FD INFILE.
       01  xCapitalRecord.
           05 xStateAbbrIn   pic X(2).
           05 xCapNameIn     pic X(14).
           05 nPopIn         pic 9(7).
           05 nFoundedIn     pic 9(4).
           05 nPopRankIn     pic 99.

       *> END WORK
       WORKING-STORAGE SECTION.
       77 xEOF     PIC X  VALUE 'n'.
       77 nLoadInc   PIC 99 VALUE 0.
       77 nProcInc   PIC 99 VALUE 0.
       77 nFilter  PIC X(9).
       
       01 xOUTPUTHEADING.
          05 FILLER  PIC XXXX    VALUE ' NUM'.
          05 FILLER  PIC XX      VALUE SPACES.
          05 FILLER  PIC X(30)   VALUE 'EMPLOYEE NAME'.
          05 FILLER  PIC XX      VALUE SPACES.
          05 FILLER  PIC X(7)    VALUE 'PAYRATE'.
          05 FILLER  PIC XX      VALUE SPACES.
          05 FILLER  PIC X(9)    VALUE 'GROSS PAY'.
          
       01 xOUTPUT. *> do this, consider formatting necessary
          05 xCapOUT   PIC 9999.
          05 FILLER       PIC XX      VALUE SPACES.
          05 xEMPNAME     PIC X(30).
          05 FILLER       PIC XX      VALUE SPACES.
          05 neHRSWORKED  PIC ZZZZ9.
          05 FILLER       PIC XX      VALUE SPACES.
          05 nePAYRATE    PIC ZZZ9.99.
          05 FILLER       PIC XX      VALUE SPACES.
          05 neGROSSPAY   PIC $$,$$9.99.
          
       01 xCapitalTable.
          05  xCapitalElement OCCURS 50 TIMES.
              10 xStateAbbrEL   pic X(2).
              10 xCapNameEL     pic X(14).
              10 nPopEL         pic 9(7).
              10 nFoundedEL     pic 9(4).
              10 nPopRankEL     pic 99.

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM 100-INITIALISATION.
           PERFORM 200-REPORT.
           PERFORM 300-TERMINATION.
           STOP RUN.
           
       100-INITIALISATION.
           OPEN INPUT INFILE.
           PERFORM 110-NXT-RCD UNTIL xEOF = 'y'.
           CLOSE INFILE.
           
       110-NXT-RCD.
           READ INFILE
              AT END
                 MOVE 'y' TO xEOF,
              NOT AT END
                 120-ADD-RCD
           END READ.
           CLOSE INFILE.
       
       120-ADD-RCD.
           ADD 1 TO nLoadInc.
           MOVE xStateAbbrIn TO xStateAbbrEL(nLoadInc).
           MOVE xCapNameIn TO xCapNameEL(nLoadInc).
           MOVE nPopIn TO nPopEL(nLoadInc).
           MOVE nFoundedIn TO nFoundedEL(nLoadInc).
           MOVE nPopIn TO nPopEL(nLoadInc).
       
       200-REPORT.
           DISPLAY " ".
           DISPLAY "Min population to search for? " WITH NO ADVANCING.
           ACCEPT nFilter.
           IF nFilter NOT = 0 *> why do this? technically can just print all 50?
              PERFORM 210-FILTER VARYING nProcInc FROM 1 BY 1 UNTIL
                 nProcInc > nLoadInc.
           END-IF.
           
       *> KEEP GOING
