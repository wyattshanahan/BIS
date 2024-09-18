       *> Assignment 3 - State Report
       identification division.
       program-id. StateReport.
       author. Wyatt Shanahan.
       environment division.
       input-output section.
       file-control.
          select infile assign to "states.txt" 
              organization is line sequential.
	   
       data division.
       file section. 
       fd infile.
       01 xInput.
          05 nstateNum pic 99.
          05 xInState pic xx.
          05 xregCode pic x.
          05 xstate pic x(20).
          05 npop pic 9(8).
          05 nlandArea pic 9(6).
       working-storage section.
       77 xEoF       pic x         value 'n'.
       77 nCount     pic 999       value 0.
       77 nTotalPop  pic 9(9)      value 0.
       77 nTotalArea pic 9(9)      value 0.
       01 xOutputHeader. *> define the upper half of the header
          05 FILLER  pic x(22)     value "State Name            ".
          05 filler  pic x(10)     value "Population".
          05 filler  pic x(5)      value spaces.
          05 filler  pic x(7)      value "Area   ".
          05 filler  pic x(2)      value spaces.
          05 filler  pic x(8)      value "Density ".
       01 xOutputLines. *> used for lines in head and foot
          05 filler  pic x(20)     value "--------------------".
          05 filler  pic x(2)      value spaces.
          05 filler  pic x(10)     value "----------".
          05 filler  pic x(5)      value spaces.
          05 filler  pic x(7)      value "-------".
          05 filler  pic x(2)      value spaces.
          05 filler  pic x(8)      value "--------".
       
       01 xOutput.
          05 xOutState    pic x(20).
          05 filler       pic x(2) value "  ".
          05 neOutPop     pic zz,zzz,zz9.
          05 filler       pic x(3) value "   ".
          05 neOutArea    pic z,zzz,zz9.
          05 filler       pic x(2) value "  ".
          05 neOutDensity pic z,zz9.99.
       
       01 xOutputFooter.
          05 filler       pic x(21) value "51 states            ".
          05 neTotalPop   pic zzz,zzz,zz9 value 0.
          05 filler       pic x(3) value "   ".
          05 neTotalArea  pic z,zzz,zz9 value 0.
          05 filler       pic x(5) value "     ".
          05 neTotalDen   pic z9.99.
      * spacing guide: SN - 2 p - 5 a - 2
       procedure division.
       000-main.
           display "Hello".
           perform 100-initialise.
           perform 200-loop until xEoF = 'y'.
           perform 300-terminate.
      	    stop run.
          
       100-initialise.
           open input infile.
           display xOutputHeader.
           display xOutputLines.
           
       200-loop.
           read infile
             at END
               move 'y' to xEoF,
             not at END
               perform 210-process,
           end-read.
           
       210-process.
           move xInState to xOutState.
           move npop to neOutPop.
           move nlandArea to neOutArea.
           compute neOutDensity = npop/nlandArea.
           compute nTotalPop = nTotalPop + npop.
           compute nTotalArea = nTotalArea + nlandArea.
           display xOutput.
           
       300-terminate.
           close infile.
           display " ".
           compute neTotalDen = nTotalPop/nTotalArea.
           move nTotalArea to neTotalArea.
           move nTotalPop to neTotalPop.
           display xOutputLines.
           display xOutputFooter.