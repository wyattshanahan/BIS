       IDENTIFICATION DIVISION.
       PROGRAM-ID. 2010ALBUMS. *> EXAM 2
       AUTHOR. WYATT SHANAHAN.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
              SELECT INFILE ASSIGN TO '2010Albums.txt'
              ORGANIZATION IS LINE SEQUENTIAL.
              
       DATA DIVISION.
       FILE SECTION.
       FD INFILE.
       01  xAlbumRecord.
           05 nRank          pic 9(2).
           05 xArtist        pic X(20).
           05 xAlbum         pic X(25).
           05 nCopySold      pic 9(8).
           05 nOverallRank   pic 9(3).
           
       WORKING-STORAGE SECTION.
       77 xEOF       PIC X  VALUE 'n'.
       77 nLoadSub   PIC 99 VALUE 0.
       77 nProcSub   PIC 99 VALUE 0.
       77 xFilter    PIC X(20).
       77 nAlbumCnt    PIC 99 VALUE 0.
       77 neAlbumCnt   PIC z9 VALUE 0.
       77 nTotalSales  PIC 9(9) VALUE 0.     
       77 neTotalSales PIC zzz,zzz,zz9 VALUE 0.
       
       01 xOUTPUTHEADING.
          05 FILLER  PIC X(10)   VALUE '2010s Rank'.
          05 FILLER  PIC X(5)    VALUE SPACES.
          05 FILLER  PIC X(13)   VALUE 'All Time Rank'.
          05 FILLER  PIC X(4)    VALUE SPACES.
          05 FILLER  PIC X(5)    VALUE 'Album'.
          05 FILLER  PIC X(18)   VALUE SPACES.
          05 FILLER  PIC X(11)   VALUE 'Copies Sold'.
          
       01 xOUTPUTDETAIL. *> fix spacing
          05 neRankOut       PIC z9.
          05 FILLER          PIC X(15)      VALUE SPACES.
          05 neOverallRank   PIC zz9.
          05 FILLER          PIC X(12)      VALUE SPACES.
          05 xAlbumOut       PIC X(25).
          05 neCopySoldOut   PIC zz999999.
          
       01 xAlbumTable.
          05  xAlbumElement OCCURS 50 TIMES.
              10 nRankEl        pic 9(2).
              10 xArtistEL      pic X(20).
              10 xAlbumEL       pic X(25).
              10 nCopySoldEL    pic 9(8).
              10 nOverallRankEL pic 9(3).

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM 100-INITIALISATION.
           PERFORM 200-REPORT.
           PERFORM 300-TERMINATION.
           STOP RUN.
           
       100-INITIALISATION.
           OPEN INPUT INFILE.
           PERFORM 110-LOAD-RCD UNTIL xEOF = 'y'.
           CLOSE INFILE.
           
       110-LOAD-RCD.
           READ INFILE
              AT END
                 MOVE 'y' TO xEOF,
              NOT AT END
                 PERFORM 120-ADD-RCD,
           END-READ.
       
       120-ADD-RCD.
           ADD 1 TO nLoadSub.
           MOVE nRank TO nRankEl(nLoadSub).
           MOVE xArtist TO xArtistEL(nLoadSub).
           MOVE xAlbum TO xAlbumEL(nLoadSub).
           MOVE nCopySold TO nCopySoldEL(nLoadSub).
           MOVE nOverallRank TO nOverallRankEL(nLoadSub).
       
       200-REPORT.
           DISPLAY " ".
           DISPLAY "Enter an artist to display top 2010s albums: "
              WITH NO ADVANCING.
           ACCEPT xFilter.
           DISPLAY " ".
           DISPLAY "TOP ALBUMS FOR " xFilter.
           DISPLAY " ".
           DISPLAY xOUTPUTHEADING.
           DISPLAY " ".
           PERFORM 210-FILTER VARYING nProcSub FROM 1 BY 1 UNTIL
              nProcSub > nLoadSub.
           
       210-FILTER.
           IF (xFilter IS EQUAL TO xArtistEL(nProcSub))
              ADD 1 to nAlbumCnt,
              MOVE nRankEl(nProcSub) TO neRankOut,
              MOVE xAlbumEL(nProcSub) to xAlbumOut,
              MOVE nCopySoldEL(nProcSub) to neCopySoldOut,
              MOVE nOverallRankEL(nProcSub) to neOverallRank,
              COMPUTE nTotalSales = 
                     nTotalSales + nCopySoldEL(nProcSub),
              DISPLAY xOUTPUTDETAIL,
            END-IF.
       
       300-TERMINATION.
           DISPLAY " ".
           MOVE nAlbumCnt to neAlbumCnt.
           MOVE nTotalSales to neTotalSales.
           DISPLAY neAlbumCnt " albums ranked.     " 
              neTotalSales " copies sold".
           DISPLAY " ".
