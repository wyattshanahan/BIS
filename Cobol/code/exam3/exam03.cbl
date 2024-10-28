       IDENTIFICATION DIVISION.
       PROGRAM-ID. exam03. *> Exam 3
       AUTHOR. WYATT SHANAHAN.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
           SELECT INFILE ASSIGN TO 'MSFastFood.txt'
             ORGANIZATION IS LINE SEQUENTIAL.
             
       DATA DIVISION.
       FILE SECTION.
       
       FD INFILE.
       01  xFoodRecord.
           05 nRankIn        pic 9(2).
           05 xCatIn         pic X(20).
           05 xNameIn        pic X(20).
           05 nNumLocsIn     pic 999.
           
              WORKING-STORAGE SECTION.
       77 xEOF       PIC X  VALUE 'n'.
       77 nLoadSub   PIC 99 VALUE 0.
       77 nProcSub   PIC 99 VALUE 0.
       77 nLocCount  PIC 999 VALUE 0.
       77 nElCnt  PIC 9(9) VALUE 0.  *> count restaurants in cat
       77 xOldCat    PIC X(20).
       
       01 xOUTPUTHEADING. 
          05 FILLER  PIC X(4)   VALUE 'RANK'.
          05 FILLER  PIC X(6)    VALUE SPACES.
          05 FILLER  PIC X(10)   VALUE 'RESTAURANT'.
          05 FILLER  PIC X(10)    VALUE SPACES.
          05 FILLER  PIC X(9)    VALUE 'LOCATIONS'.
          
       01 xOUTPUTDETAIL. 
          05 neRankOut       pic z9.
          05 FILLER          PIC X(8)      VALUE SPACES.
          05 xNameOut        pic X(20).
          05 FILLER          PIC X(2)      VALUE SPACES.
          05 neNumLocsOut     pic zz9.
          
       01 xCONTROL.
          05 FILLER     PIC x(3) VALUE SPACES.
          05 neLocCount PIC zz9 VALUE 0.
          05 FILLER     PIC X(14) VALUE ' locations in '.
          05 xCatOut PIC X(20) VALUE SPACES.
          05 FILLER     PIC X(10)    VALUE SPACES.
          05 neAvgLocs PIC zz9.99 VALUE 0.
          05 FILLER     PIC X(18)   VALUE ' average locations'.        
          
       01 xFoodTable.
          05  xFoodElement OCCURS 33 TIMES.
              10 nRankEl        pic 9(2).
              10 xCatEl         pic X(20).
              10 xNameEl        pic X(20).
              10 nNumLocsEl     pic 999.

       PROCEDURE DIVISION.
          000-MAIN.
              PERFORM 100-INITIALISATION.
              PERFORM 200-PROCESS.
              PERFORM 300-TERMINATION.
              STOP RUN.
           
          100-INITIALISATION.
              OPEN INPUT INFILE.
              PERFORM 110-LOAD-DATA UNTIL xEOF = 'y'.
              CLOSE INFILE.
              PERFORM 130-SORT.
              DISPLAY xOUTPUTHEADING.
              DISPLAY ' '.
              
          110-LOAD-DATA.
           READ INFILE
              AT END
                 MOVE 'y' TO xEOF,
              NOT AT END
                 PERFORM 120-ADD-EL,
           END-READ.
           
          120-ADD-EL.
            ADD 1 TO nLoadSub.
            MOVE nRankIn TO nRankEl(nLoadSub).
            MOVE xCatIn TO xCatEl(nLoadSub).
            MOVE xNameIn TO xNameEl(nLoadSub).
            MOVE nNumLocsIn TO nNumLocsEl(nLoadSub).
            
         130-SORT.
            SORT xFoodElement ON ASCENDING KEY nRankEl.
            SORT xFoodElement ON ASCENDING KEY xCatEl.
            
         200-PROCESS.
            PERFORM 210-OUTPUT-EL VARYING nProcSub FROM 1 BY 1
               UNTIL nProcSub>nLoadSub.
            
         210-OUTPUT-EL. 
            IF nElCnt = 0
              MOVE xCatEl(nProcSub) TO xOldCat,
            END-IF.
            IF xCatEl(nProcSub) NOT = xOldCat
              PERFORM 220-CONTROL,
            END-IF.
            ADD 1 TO nElCnt.
            MOVE nRankEl(nProcSub) TO neRankOut.
            MOVE xNameEl(nProcSub) TO xNameOut.
            MOVE nNumLocsEl(nProcSub) TO neNumLocsOut.
            ADD nNumLocsEl(nProcSub) TO nLocCount.
            DISPLAY  xOUTPUTDETAIL.
         
         220-CONTROL.
           MOVE xOldCat TO xCatOut.
           MOVE xCatEl(nProcSub) TO xOldCat.
           MOVE nLocCount TO neLocCount.
           COMPUTE neAvgLocs = nLocCount / nElCnt.
           DISPLAY ' '.
           DISPLAY xControl.
           DISPLAY ' '.
           MOVE 0 TO nElCnt, nLocCount.
         
         300-TERMINATION.
          PERFORM 220-CONTROL.
