      *> A program to convert US Dollars to Mexican Pesos
	  *> At the time of writing, 1.00 USD = 19.98654 MXN
       identification division.
       program-id. PesoConverter.
	   author. Wyatt Shanahan.

       environment division.

       data division.
      * When writing this program, I was unsure how many digits
      * were necessary, so I guessed and gave the amt below
       working-storage section.
       77 nUSDollars pic 999999999v99.
       77 neMXPesos pic $$$,$$$,$$$,$$9.99.
       
       procedure division.
       000-main.
           display " ".
           display "Welcome to the currency converter.".
           display " ".
           display "Enter a US Dollar amount to convert: " 
              with no advancing.
           accept nUSDollars.
           compute neMXPesos = nUSDollars * 19.98654.
           display "That amount in Mexican Pesos is: " neMXPesos.
           display " ".
           display "Thanks for using the service. Safe travels!".
           display " ".
           stop run.
