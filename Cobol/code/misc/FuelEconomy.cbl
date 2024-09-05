      *> Fuel Economy Conversion Tool (US Units)
      *> An in-class program developed 04/SEP/2024
       identification division.
       program-id. FuelCalculator.
       author. Wyatt Shanahan.
      
       environment division.
      
       data division.
       working-storage section.
       77 nInputMiles        pic 99999.
       77 nInputUSGal        pic 999v9.
       77 neOutputMPG        pic zz9.99.
      
       procedure division.
       000-main.
           display " ".
           display "How many miles have you driven?  "
              with no advancing.
           accept nInputMiles.
           
           display " ".
           display "How many gallons were consumed?  " 
              with no advancing.
           accept nInputUSGal.
           
           compute neOutputMPG = nInputMiles / nInputUSGal.
           display " ".
           display "Mi/Gal: " neOutputMPG.
           display " ".
           stop run.
           