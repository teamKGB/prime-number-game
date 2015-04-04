# Prime number game

Final Project: Deadline: Tue. April 28


Using Java, Scala or Apple Swift implement the following app for Android, iOS, Windows, Mac OS or Linux.

You want to teach kids about prime numbers by rearranging small tiles (denoted here as `*`) to form a rectangle or square with both sides having at least length 2.

For instance, given 6 tiles `******`, a valid rearrangement would be

`***`<br>
`***`

indicating that the number of tiles, 6, is composite. If given 5 tiles, not being able
to arrange them in rectangle would indicate that the number 5 if prime. Rearranging them
as `*****` does not count, as both prime and composite numbers can be expressed this way.

If the number is composite, winning the game means finding a valid rearrangement such that the sides of the rectangle provide a factoring of the number.

If the number is prime, winning the game means pressing the button "Is Prime!". Pressing a the button means loosing the game if the number is composite.

The game should use a timer for giving the appropriate time to solve the problem and you might want to organize the game to have multiple levels. Running out of time also means loosing the game.

We leave the design details to you, partly depending on the use of touch or keyboard/mouse interface.
