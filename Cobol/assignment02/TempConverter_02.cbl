       identification division.
       program-id. TempConverter.

       environment division.

       data division.
       
       working-storage section.
       01 nFah pic s999999v99.
       01 neCent pic s999999v99.
       
       procedure division.
       000-main.
           display " ".
           display "Welcome to temperature converter".
           display " ".
           display "Enter a fahrenheit temp to convert to celsius: ".
           accept nFah.
           compute neCent = (nFah - 32) * 0.5556.
           display "The value in celsius is " neCent.
           display " ".
           
           stop run.
           