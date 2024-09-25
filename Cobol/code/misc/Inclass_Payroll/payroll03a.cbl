       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYROLL-03A. *> in-class payroll example
       AUTHOR. WYATT SHANAHAN.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
           SELECT INFILE ASSIGN TO 'PayrollWeekly.txt'
             ORGANIZATION IS LINE SEQUENTIAL.
           SELECT MASTERFILE ASSIGN TO 'PayrollMaster.txt'
             ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTFILE ASSIGN TO 'Payroll.rpt'
             ORGANIZATION IS LINE SEQUENTIAL.
             
       DATA DIVISION.
       FILE SECTION.
       
       FD INFILE.
       01 xINPUT.
          05  nEMPNUMIN     PIC 9999.
          05  nHRSWORKED    PIC 999.
          
       FD MASTERFILE.
       01 xMASTER.
           05 nDEPT         PIC 9.
           05 nEMPNUMMSTR   PIC 9999.
           05 xLNAME        PIC X(20).
           05 xFNAME        PIC X(20).
           05 nPAYRATE      PIC 999v99.
           
       FD OUTFILE.
       01 xOUTPUT           PIC X(80).
       
       WORKING-STORAGE SECTION.
       77 xEOFTX     PIC X  VALUE 'n'.
       77 xEOFMSTR   PIC X  VALUE 'n'.
       
       01 xOUTPUTHEADING.
          05 FILLER  PIC XXXX    VALUE ' NUM'.
          05 FILLER  PIC XX      VALUE SPACES.
          05 FILLER  PIC X(30)   VALUE 'EMPLOYEE NAME'.
          05 FILLER  PIC XX      VALUE SPACES.
          05 FILLER  PIC X(7)    VALUE 'PAYRATE'.
          05 FILLER  PIC XX      VALUE SPACES.
          05 FILLER  PIC X(9)    VALUE 'GROSS PAY'.
          
       01 xOUTPUTDETAIL.
          05 nEMPNUMOUT   PIC 9999.
          05 FILLER       PIC XX      VALUE SPACES.
          05 xEMPNAME     PIC X(30).
          05 FILLER       PIC XX      VALUE SPACES.
          05 neHRSWORKED  PIC ZZZZ9.
          05 FILLER       PIC XX      VALUE SPACES.
          05 nePAYRATE    PIC ZZZ9.99.
          05 FILLER       PIC XX      VALUE SPACES.
          05 neGROSSPAY   PIC $$,$$9.99.
          
       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM 100-INITIALISATION.
           PERFORM 200-LOOP UNTIL xEOFTX = 'y'.
           PERFORM 300-TERMINATION.
           STOP RUN.
           
       100-INITIALISATION.
           OPEN INPUT INFILE.
           OPEN OUTPUT OUTFILE.
           WRITE xOUTPUT FROM xOUTPUTHEADING BEFORE ADVANCING 1 LINE.
           
       200-LOOP.
           READ INFILE
              AT END
                     MOVE 'y' TO xEOFTX
              NOT AT END
                     PERFORM 210-PROCESS
           END-READ.
       
       210-PROCESS.
           MOVE 'n' TO xEOFMSTR.
           OPEN INPUT MASTERFILE.
           PERFORM 220-READ-MASTER UNTIL xEOFMSTR = 'y'.
           CLOSE MASTERFILE.
           
       220-READ-MASTER.
           READ MASTERFILE
              AT END
                     MOVE 'y' TO xEOFMSTR
              NOT AT END
                     PERFORM 230-GEN-DETAIL
           END-READ.
       
       230-GEN-DETAIL.
           MOVE nEMPNUMIN TO nEMPNUMOUT.
           MOVE FUNCTION CONCATENATE(FUNCTION TRIM(xLNAME), ", ",
             xFNAME) TO xEMPNAME.
           MOVE nHRSWORKED TO neHRSWORKED.
           MOVE nPAYRATE TO nePAYRATE.
           MULTIPLY nHRSWORKED BY nPAYRATE GIVING neGROSSPAY ROUNDED.
           
           WRITE xOUTPUT FROM xOUTPUTDETAIL BEFORE ADVANCING 1 LINE.
           
       300-TERMINATION.
           CLOSE INFILE.
           CLOSE OUTFILE.
