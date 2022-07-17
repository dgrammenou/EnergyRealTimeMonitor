 # NTUA ECE SAAS 2022 PROJECT
  
## TEAM (23)
  
Παρακάτω περιγράφουμε την δομή του project μας:
Αρχικά, έχουμε φτιάξει 8 microservices, τρία για τους getters-agpt getter (φάκελος: agpt_getter),atl getter (φάκελος: atl_getter),ff getter (φάκελος: phf_getter) -(γραμμένα σε Postgres),τρία για τους display-agpt display (φάκελος: agpt_display),atl display (φάκελος: atl_display), ff display (φάκελος: ff_display) -(γραμμένα και αυτά σε postgres), ένα για τους users (φάκελος: users) και τέλος ένα για το management των subscriptions των users (φάκελος: schedule_users).Η επικοινωνία μεταξύ των getter microservices και display microservices γίνεται μέσω Kafka (messaging).Αυτό που κάνουν τα microservices του getter είναι να διαβάζουν τα CSVs και να αποθηκεύουν τα δεδομένα στην βάση τους(η οποία αποτελείται σε καθένα απο αυτά απο 44 tables,τόσα όσες είναι και οι χώρες).Όποτε ένα microservice του getter διαβάσει νέα δεδομένα κάνει publish στο αντίστοιχο topic στο Kafka οτι έχει νέα δεδομένα.Τότε το αντίστοιχο microservice του display θα πρέπει να χτυπήσει το κατάλληλο api για να πάρει αυτά τα καινούρια δεδομένα και να τα αποθηκεύσει στην βάση του(η οποία αποτελείται σε καθένα απο αυτά απο 44 tables,τόσα όσες είναι και οι χώρες).Τα display microservices επικοινωνούν με το frontend(το οποίο είναι γραμμένο σε Αngular).Όσον αφορά το microservice των users φτιάχτηκε για να διαχειρίζεται τις συνδρομές των διάφορων users ενώ το microservice των subscriptions φτιάχτηκε προκειμένου να μειώνεται ανά μία ημέρα το Expiration Date του κάθε user.

Για λόγους modularity επίσης βάλαμε και τις βάσεις του κάθε microservice σε docker container (εκτός από το users που έχει τη βάση στο ίδιο docker container και εκτός από το schedule_users που δεν χρειάζεται βάση)! 

Οδηγίες για να χρησιμοποιήσει κάποιος την εφαρμογή μας:

Το πρώτο βήμα είναι να συνδεθεί μέσω της Google στην εφαρμογή μας, το URL είναι:



Στη συνέχεια αφού συνδεθεί, μπορεί να επιλέξει το γράφημα(ή τα γραφήματα) που θα ήθελε να δει διαλέγοντας την ημερομηνί που θα ήθελε, τον τύπο (δηλαδή GenerationPerType,ActualTotalLoad,CrossBoarderFlow) καθώς και την χώρα. Ακόμα υπάρχουν τα κουμπιά:ImportNewCsv, το πατάει ο χρήστης οπότε θέλει να του εμφανιστούν νέα δεδομένα(για να φαίνεται καλύτερα-ευκολότερα το real-time display, από τη στιγμή που δεν έχουμε FTP server διαθέσιμο) και το ResetDΒ, προκειμένου να αδειάσουν όλες οι βάσεις και να μπορεί ο χρήστης να κάνει απο την αρχή import τα CSV (πρακτικά να ξεκινήσει τη διαδικασία από την αρχή).Επιπροσθέτως μπορούμε να κάνουμε save τα δεδομένα ως svg πατώντας το κουμπί Save as svg, ή μπορούμε να τα κάνουμε save ως txt πατώντας το κουμπί Save Data. Τέλος έχουμε προσθέσει ένα + button προκειμένου να είναι δυνατή η απεικόνιση πολλαπλών διαγραμμάτων ταυτόχρονα.
  

Ωστόσο εάν είναι επιθυμητό το να test-αριστεί η εφαρμογή locally (σε Unix OS και μόνο) τα απαραίτητα είναι:

- Docker + docker-compose
- Kafka + kafkacat 

- Τέλος στον αρχικό φάκελο να τρέξει:

    ./automated.sh agpt_getter agpt_display atl_getter atl_display phf_getter phf_display users energy-live-deploy shcedule_users
## ΠΡΟΣΟΧΗ: ΕΑΝ ΔΕΝ ΔΟΥΛΕΥΕΙ ΤΟ ΠΑΡΑΠΑΝΩ για τα agpt_getter και για τη βάση του αντίστοιχα τότε το πιο πιθανό είναι να έχει κάνει bind κάποια άλλη διεργασία στον υπολογιστή (πχ η postgres locally, τη οποία την κάνει κανείς stop με την εντολή: sudo service postgresql stop)
## Επίσης εάν βγάζει ότι κάποιος kafka broker δεν είναι alive τότε απλά ξαναεκτελέστε την παραπάνω εντολή!

Αφού τελειώσει το build στο παραπάνω (παίρνει λίγο χρόνο) είτε θα μπορεί να μπει στο παρακάτω url:
    localhost:6543/
και να πλοηγηθεί σε ολόκληρη την εφαρμογή μέσω του Frontend είτε να χτυπήσει τα παρακάτω URLs (βάζουμε μόνο αυτά που έχουν νόημα στο παραπάνω τρόπο πλοήγησης):

    ##getter microservices:
    localhost:8081/healthCheck
    localhost:8082/healthCheck
    localhost:8083/healthCheck

    localhost:8081/agpt/ResetDB
    localhost:8082/atl/ResetDB
    localhost:8083/ff/ResetDB

    localhost:8081/agpt/ImportNewCsv
    localhost:8082/atl/ImportNewCsv
    localhost:8083/ff/ImportNewCsv    

    localhost:8081/getIniData/:country
    localhost:8082/getIniData/:country
    localhost:8083/getIniData/:country

    localhost:8081/getData/:country/:dataFrom/:dataTo/:typeOfEnergy    
    localhost:8082/getData/:country/:dataFrom/:dataTo
    localhost:8083/getData/:countryFrom/to/:countryTo/:dataFrom/:dataTo

    ##display microsrvices:  
    localhost:7081/healthCheck
    localhost:7082/healthCheck
    localhost:7083/healthCheck

    localhost:7081/api/GenerationPerType/chart?country=..&generationType=..&date=..

    localhost:7082/api/ActualTotalLoad/chart?country=..&date=..

    localhost:7083/api/CrossBoarderFlow/chart?countr=..&incountr=..&date=..


Στα παραπάνω URLs το format της ημερομηνίας πρέπει να είναι: YYYY-MM-DD (χωρίς την ώρα, δηλαδή request για μία συγκεκριμένη μέρα)


Για οποιοδήποτε πρόβλημα αντιμετωπισθεί με τα παραπάνω μπορείτε να μας στείλετε ένα μήνυμα στο mail.
