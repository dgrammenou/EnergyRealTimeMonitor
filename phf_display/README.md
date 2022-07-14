# MICROSERVICE

## phf_display

Microservice το οποίο παρέχει στο frontend τα δεδομένα τύπου PhysicalFlow που ζητάει. Η βάση που διαχειρίζεται είναι οργανωμένη σε ξεχωριστά tables για κάθε χώρα (έχει συνολικά τόσα tables όσες είναι και οι χώρες) όπως ακριβώς και εκείνη του αντίστοιχου getter. Οι δύο βάσεις είναι συγχρονισμένες ως εξής: κάθε φορά που ο getter κάνει import νέα δεδομένα κάνει publish στο Kafka  στο phf topic οτι έχει νέα δεδομένα, οπότε το phf_display στέλνει get request στο api του phf_getter "/newData/:country" για να τα πάρει και να ενημερώσει την βάση του με αυτά.

Κάθε φορά που ο user κάνει κάποιο αίτημα για εμφάνιση δεδομένων στο frontend, εκείνο κάνει get request στο api του phf_display "/api/:country/:incountry/:date" για να γίνει το κατάλληλο query στην βάση του phf_display και το frontend να λάβει τα δεδομένα ώστε στην συνέχεια να τα αναπαραστήσει διαγραμματικά.
