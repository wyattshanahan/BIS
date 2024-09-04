      *> A program to convert Fahrenheit Temperatues to Celcius
       identification division.
       program-id. TempConverter.

       environment division.

       data division.
       
       working-storage section.
       01 nFah pic s999999v99.
       01 nCel pic s999999v99.
       
       procedure division.
       000-main.
           display " ".
           display "Welcome to temperature converter.".
           display " ".
           display "Enter a fahrenheit temp to convert to celsius: ".
           accept nFah.
           compute nCel = (nFah - 32) * 0.5556.
           display "The value in celsius is " nCel.
           display " ".
           display "Thanks for using the service. Goodbye.".
           display " ".
           stop run.
           
