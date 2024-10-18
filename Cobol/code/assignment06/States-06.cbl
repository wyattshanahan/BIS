       IDENTIFICATION DIVISION.
       PROGRAM-ID. STATES-06. *> Homework 6
       AUTHOR. WYATT SHANAHAN.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
           SELECT INFILE ASSIGN TO 'States.txt'
             ORGANIZATION IS LINE SEQUENTIAL.
             
       DATA DIVISION.
       FILE SECTION.
       
       FD INFILE.
       01  xStateRecord.
           05 nStateNumIn    pic 9(2).
           05 xStateAbIn     pic X(2).
           05 xRegCodeIn     pic X.
           05 xStateNameIn   pic X(20).
           05 nPopIn         pic 9(8).
           05 nAreaIn        pic 9(6).
           
              WORKING-STORAGE SECTION.
       77 xEOF       PIC X  VALUE 'n'.
       77 nLoadSub   PIC 99 VALUE 0.
       77 nProcSub   PIC 99 VALUE 0.
       77 xFilter    PIC X(20).
       77 nStateCnt  PIC 99 VALUE 0.
       77 nStatePop  PIC 9(9) VALUE 0.
       77 nStateArea PIC 9(9) VALUE 0.  
       77 xOldReg    PIC X.
       
       01 xOUTPUTHEADING. *> TODO - do I actually need this?
          05 FILLER  PIC X(3)   VALUE 'Reg'.
          05 FILLER  PIC X(7)    VALUE SPACES.
          05 FILLER  PIC X(14)   VALUE 'State'.
          05 FILLER  PIC X(7)    VALUE SPACES.
          05 FILLER  PIC X(10)    VALUE 'Population'.
          05 FILLER  PIC X(10)   VALUE SPACES.
          05 FILLER  PIC X(4)   VALUE 'Area'.
          05 FILLER  PIC X(4)    VALUE SPACES.
          05 FILLER  PIC X(5) VALUE 'Dens.'.
          
       01 xOUTPUTDETAIL. 
          05 xRegCodeOut     PIC X.
          05 FILLER          PIC X(9)      VALUE SPACES.
          05 xStateOut       PIC X(20).
          05 FILLER          PIC X(1)      VALUE SPACES.
          05 nePopOut        PIC zz,999,999 VALUE 0.
          05 FILLER          PIC X(7) VALUE SPACES.
          05 neAreaOut       PIC zz9,999 VALUE 0.
          05 FILLER          PIC X(3) VALUE SPACES.
          05 neDenOut        PIC zzz9.99 VALUE 0. 
          
       01 xCONTROL.
          05 neStateCnt PIC z9 VALUE 0.
          05 FILLER     PIC X(7) VALUE ' states'.
          05 FILLER     PIC X(21) VALUE SPACES.
          05 neStatePop PIC zzz,999,999 VALUE 0.
          05 FILLER     PIC X(3)    VALUE SPACES.
          05 neStateArea PIC zzz,zzz,zz9 VALUE 0.
          05 FILLER     PIC X(4)   VALUE SPACES.
          05 neStateDen PIC z99.99  VALUE 0.         
          
       01 xStateTable.
          05  xStateElement OCCURS 51 TIMES.
              10 xRegCodeEl     pic X.
              10 xStateNameEl   pic X(20).
              10 nPopEl         pic 9(8).
              10 nAreaEl        pic 9(6).
              10 nDensityEl     pic 9(4)v99.

       PROCEDURE DIVISION.
          000-MAIN.
              PERFORM 100-INITIALISATION.
              PERFORM 200-PROCESS.
              PERFORM 300-TERMINATION.
              STOP RUN.
           
          100-INITIALISATION.
              OPEN INPUT INFILE.
              PERFORM 110-LOAD-RCD UNTIL xEOF = 'y'.
              CLOSE INFILE.
              PERFORM 130-SORT.
              DISPLAY xOUTPUTHEADING.
              DISPLAY ' '.
              
          110-LOAD-RCD.
           READ INFILE
              AT END
                 MOVE 'y' TO xEOF,
              NOT AT END
                 PERFORM 120-ADD-RCD,
           END-READ.
           
          120-ADD-RCD.
            ADD 1 TO nLoadSub.
            MOVE xRegCodeIn TO xRegCodeEl(nLoadSub).
            MOVE xStateNameIn TO xStateNameEl(nLoadSub).
            MOVE nPopIn TO nPopEl(nLoadSub).
            MOVE nAreaIn TO nAreaEl(nLoadSub).
            COMPUTE nDensityEl(nLoadSub) = nPopIn / nAreaIn.
            
         130-SORT.
            SORT xStateElement ON ASCENDING KEY xStateNameEl.
            SORT xStateElement ON ASCENDING KEY xRegCodeEl.
            
         200-PROCESS.
            PERFORM 210-OUTPUT VARYING nProcSub FROM 1 BY 1
               UNTIL nProcSub>nLoadSub.
            
         210-OUTPUT. 
            IF nStateCnt = 0
              MOVE xRegCodeEl(nProcSub) TO xOldReg,
            END-IF.
            IF xRegCodeEl(nProcSub) NOT = xOldReg
              PERFORM 220-CONTROL,
            END-IF.
            ADD 1 TO nStateCnt.
            MOVE xRegCodeEl(nProcSub) TO xRegCodeOut.
            MOVE xStateNameEl(nProcSub) TO xStateOut.
            MOVE nPopEl(nProcSub) TO nePopOut.
            ADD nPopEl(nProcSub) TO nStatePop.
            MOVE nAreaEl(nProcSub) TO neAreaOut.
            ADD nAreaEl(nProcSub) TO nStateArea.
            COMPUTE neDenOut = nPopEl(nProcSub) / nAreaEl(nProcSub).
            DISPLAY  xOUTPUTDETAIL.
         
         220-CONTROL.
           MOVE xRegCodeEl(nProcSub) TO xOldReg.
           MOVE nStateCnt TO neStateCnt.
           MOVE nStatePop TO neStatePop.
           MOVE nStateArea TO neStateArea.
           COMPUTE neStateDen = nStatePop / nStateArea.
           DISPLAY ' '.
           DISPLAY xControl.
           DISPLAY ' '.
           MOVE 0 TO nStateCnt, nStateArea, nStatePop.
         
         300-TERMINATION.
          PERFORM 220-CONTROL.

