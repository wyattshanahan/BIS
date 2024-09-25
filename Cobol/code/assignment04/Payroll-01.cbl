       identification division.
       PROGRAM-ID. PAYROLL-01.
       author. WYATT SHANAHAN.
       
       environment division.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
           SELECT INFILE ASSIGN TO "Payroll.master.txt"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT TRANSACTIONFILE ASSIGN TO "Payroll.transaction.txt"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTFILE ASSIGN TO "Payroll-01-output.txt"
              ORGANIZATION IS LINE SEQUENTIAL.
              
       DATA DIVISION.
       FILE SECTION.
       
       FD INFILE.
       01 xInRecord.
          05 nInDeptNum     PIC 9.
          05 nInEmplNum     PIC 9999.
          05 xInLName       PIC x(20).
          05 xInFName       PIC x(20).
          05 nInPayRate     PIC 999v99.
          
       FD TRANSACTIONFILE.
       01 xTransactionRecord.
          05 nTransEmplNum   PIC 9999.
          05 nTransEmpHrs    PIC 999.
         
       FD OUTFILE.
       01 xOutput        PIC x(80).
       
       WORKING-STORAGE SECTION.
       
       77 xMasterEOF PIC x         VALUE 'n'. *> MASTER EOF
       77 xTransEOF  PIC x         VALUE 'n'. *>TRANSACTION EOF
       77 xEmpNumFd  PIC x         VALUE 'n'. *>flag for employee number found
       77 nEmplPay   PIC 9(5)v99.  
       77 nEmplCnt   PIC 999       VALUE 0.
       77 nHourSum   PIC 9(5)      VALUE 0.
       77 nGrossSum  PIC 9(7)v99   VALUE 0.
       77 xBLine     pic x         VALUE spaces.
       
       01 xHeader.
          05 FILLER  PIC x(5)      VALUE 'DEPT '.
          05 FILLER  PIC x(8)      VALUE 'EMP NUM '.
          05 FILLER  PIC x(8)      VALUE 'EMP NAME'.
          05 FILLER  PIC x(17)     VALUE '                 '.
          05 FILLER  PIC x(15)     VALUE '               '.
          05 FILLER  PIC x(8)      VALUE 'EMP HRS '.
          05 FILLER  PIC x(7)      VALUE 'EMP PAY'.
          
       01 xLines. *> done as an object for convenience
          05 FILLER  PIC x(21)     VALUE '---- ------- --------'.
          05 FILLER  PIC x(17)     VALUE '                 '.
          05 FILLER  PIC x(15)     VALUE '               '.
          05 FILLER  PIC x(15)     VALUE '------- -------'.
       
       01 xFooter.
          05 neEmpCount     PIC zz9.
          05 FILLER         PIC x(14)     VALUE ' employees'.
          05 neHrsCnt       PIC zzzz9.
          05 FILLER         PIC x(14)     VALUE ' hrs worked'.
          05 FILLER         PIC x(13)     VALUE '             '.
          05 neGrossPay     pic $z,zz9.99.
          05 FILLER         PIC x(10)     VALUE ' gross pay'.
          
       01 xOutputStream.
          05 neOutDept      PIC 9.
          05 FILLER         PIC xxxx     VALUE '    '.
          05 neOutEmpNum    PIC 9999.
          05 FILLER         PIC xxxx     VALUE '    '.
          05 xOutName       PIC x(40).
          05 neOutHrs       PIC zz9.
          05 FILLER         PIC x(5).
          05 neOutPay       PIC $$$9.99.
          
       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM 100-INITIALISE.
           PERFORM 200-LOOP UNTIL xTransEOF = 'y'.
           PERFORM 300-TERMINATION.
           STOP RUN.
          
       100-INITIALISE.
           OPEN OUTPUT OUTFILE.
           DISPLAY xHeader.
           DISPLAY xLines.
           MOVE xHeader TO xOutput.
           WRITE xOutput BEFORE ADVANCING 1 LINE.
           MOVE xLines TO xOutput.
           WRITE xOutput BEFORE ADVANCING 1 LINE.
           OPEN INPUT TRANSACTIONFILE.
           
       200-LOOP. *> iterate over transaction file
           READ TRANSACTIONFILE
             AT END
               MOVE 'y' TO xTransEOF,
             NOT AT END
               PERFORM 210-PROCESS,
           END-READ.
       
       210-PROCESS.
           MOVE 'n' TO xEmpNumFd.
           MOVE 'n' TO xMasterEOF.
           OPEN INPUT INFILE.
           PERFORM 220-MSTR UNTIL xEmpNumFd = 'y' OR xMasterEOF = 'y'.
           CLOSE INFILE.
           IF xEmpNumFd = 'y'
              PERFORM 230-PROC-BOTH
           END-IF.
           
       220-MSTR.
           READ INFILE
              AT END
                MOVE 'y' TO xMasterEOF,
              NOT AT END
                IF nInEmplNum = nTransEmplNum
                   MOVE 'y' TO xEmpNumFd,
                END-IF,
           END-READ. 
           
       230-PROC-BOTH.
           MOVE nInDeptNum TO neOutDept.
           MOVE nInEmplNum TO neOutEmpNum.
           PERFORM 240-BUILDNAME.
           MOVE nTransEmpHrs TO neOutHrs.
           COMPUTE nHourSum = nHourSum + nTransEmpHrs.
           COMPUTE nEmplPay = nTransEmpHrs * nInPayRate.
           COMPUTE nEmplCnt = nEmplCnt + 1.
           COMPUTE nGrossSum = nGrossSum + nEmplPay.
           MOVE nEmplCnt to neEmpCount.
           MOVE nHourSum to neHrsCnt.
           MOVE nEmplPay TO neOutPay.
           MOVE nGrossSum TO neGrossPay.
           DISPLAY xOutputStream.
           MOVE xOutputStream TO xOutput.
           WRITE xOutput BEFORE ADVANCING 1 LINE.
           MOVE ' ' TO xOutName.
           
       240-BUILDNAME. *> used to concatenate name into an output
           STRING
               xInLName DELIMITED BY SPACE
               ',' DELIMITED BY SIZE
               ' ' DELIMITED BY SIZE
               xInFName DELIMITED BY SPACE
               INTO xOutName.
           
       300-TERMINATION.
           CLOSE TRANSACTIONFILE.
           DISPLAY xLines.
           DISPLAY xFooter.
           MOVE xLines TO xOutput.
           WRITE xOutput BEFORE ADVANCING 1 LINE.
           MOVE xFooter TO xOutput.
           WRITE xOutput.
           CLOSE OUTFILE.
