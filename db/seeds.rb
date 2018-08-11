# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Disease.create(name: "Influenza",
               what: "Influenza ist bekannt als Grippe. Die Krankheit bekommt ihren von dem Influenza Virus. Die gefährlichste Variante ist der Typ A. Des weiteren gibt es Typ B und Typ C. Meistens ist die Infektion nach wenigen Tagen bis zu einer Woche überstanden. "+
                     "Influenza tritt vor allem in den kalten Jahreszeiten auf. Tritt vorwiegend bei Immunschwachen und älteren Menschen auf und kann auch tödlich enden.",
               infection: "Die Grippeviren befallen Vorwiegend Schleimhautzellen wie z.B. die in der Nase. Diese Viren verbreiten sich dann an diesen Stellen. Verbreitet wird diese Krankheit bzw. die Erreger vor allem durch “Tröpfcheninfektion” (z.B. durch Niesen oder einatmen der Tröpfchen). "+
                          "Influenza Viren können auch außerhalb des Körpers überleben. So ist möglich auch durch Körperkontakt diese Viren zu übertragen.",
               symptom: "Symptome können bereits nach Zwei Tagen der Ansteckung auftreten. Es beginnt meist mit starken Krankheitsgefühl. Dazu kann Fieber, Husten und auch Halsschmerzen. Weiterhin können Kopf- und Gliederschmerzen, Übelkeit und tränende Augen auftreten.",
               counteraction: "Wichtig bei einer Infektion ist möglich viel Bettruhe zu haben. Je nachdem welche  Symptome  auftreten kann man diese entgegenwirken. Bei Husten und laufender Nase wäre Inhalieren Empfehlenswert. Jegliche Schmerzen wie z.B. Gliederschmerzen lassen sich mit Schmerzmitteln bekämpfen. "+
                              "Bei Fieber und schwitzen ist es wichtig genug Flüssigkeiten zu sich zu nehmen. Medikamente sind vor allem antivirale ( gegen Viren wirkende Stoffe). "+
                              "Um die Infektion zu verhindern ist eine jährliche Impfung zu empfehlen. Besonders für Schwangere und Menschen über dem 60. Lebensjahr ist dies wichtig. Außerdem sollte man darauf achten seine Hände gründlich zu waschen."
)

Disease.create(name: "Tetanus",
               what: "Tetanus wird durch eine Infektion mit dem Bakterium Clostridium tetani verursacht. Dieses findet man im Erdreich, also überall.",
               infection: "Da man diesen Erreger überall findet kann man sich leicht infizieren. Es reicht bereits eine kleine Wunde wie z.B. ein kleiner Schnitt mit Papier. Wenn man infiziert wurde beginnen die Bakterien 2 Toxine herzustellen. Tetanospasmin und Tetanolysin.",
               symptom: "Symptome sind:  Blutdruckanstieg, Schwitzen, Schmerzen (meist im Nacken und Gesicht), Halsschmerzen, Herzrasen, Mundsperre, Zungen und Kiefermuskeln verkrampfen. "+
                        "Tetanospasmin bewirkt diese Symptome. Tetanolysin dagegen kann rote Blutkörperchen zerstören und richtet so Schaden am Herz an.",
               counteraction: "Es gelten 3 Grundregeln: 1. Neutralisierung des Tetanus-Gifts und Immunisierung, 2. Ausschneiden der Wundränder und 3. Unterstützende Maßnahmen gegen die Symptome. Antibiotika wirkt gegen diese Erreger. Um gegen das Gift zu kämpfen werden Antikörper gespritzt. "+
                              "Wichtig bei der Behandlung ist Atemwege Frei zu halten. Häufig wird auch mit einer Beatmungsmaschine nachgeholfen. Die Muskelkrämpfe werden mit Medikamenten bekämpft. Um Vorzusorgen kann man sich gegen Tetanus Impfen lassen."
)

Disease.create(name: "Keuchhusten",
               what: "Keuchhusten ist eine sehr ansteckende Krankheit. Genauer ist es eine Infektion der oberen Atemwege.",
               infection:"Über Tröpfcheninfektion. Also Küssen, Niesen, Sprechen oder Husten.",
               symptom:"Sind in der 1.Phase : Husten, Niesen, Halsschmerzen, laufende Nase. Ähnelt einer normalen Erkältung.In der 2.Phase: Krampfartige Hustenanfälle( Bis zu 50 mal am Tag), Atemnot, kein Hunger, kein Durst, Schlaflosigkeit",
               counteraction:"Entgegenwirken kann man mit Antibiotika. Gegen das Husten hilft Hustensaft und auch warme Brustwickel. Außerdem sollte man immer genug trinken. Hier gilt auch wieder, rechtzeitiges impfen mindert die Chance krank zu werden."
)

Disease.create(name: "Gelbfieber",
               what: "Gelbfieber wird verursacht durch das Gelbfieber Virus. Übertragen wird es durch Mücken, die mit diesem Virus infiziert sind. Verbreitet vor allem in Afrika und Südamerika. man unterscheidet in Dschungel Gelbfieber und Stadt Gelbfieber, je nachdem wie und wo man infiziert wird.",
               infection: "Bei beiden Varianten sind Tiere der Ursprung. Bei dem Dschungel Gelbfieber können z.B. Affen sein, die infiziert sind. Daraufhin wird der Virus von Stechmücken an den dort lebenden Menschen übertragen. "+
                          "Bei dem Stadt Gelbfieber besitzt ein Mensch diesen Virus den er z.B. aus anderen Ländern mitgebracht hat. Dieser kann dann auch wieder über Stechmücken übertragen werden.",
               symptom: "Die Symptome erscheinen binnen 3 bis 6 Tagen nach der Ansteckung. Gelbfieber verläuft in vielen Fällen wie eine Grippe. Typisch wäre in diesem Fall: Fieber, Kopfschmerzen, Gliederschmerzen, Muskelschmerzen, Schüttelfrost, Übelkeit und Erbrechen. "+
                        "Nach einigen Tagen ist Krankheit meistens vorüber. Bei schlimmeren Fällen tritt folgendes auf: Erbrechen von Galle, Durchfall, starker Durst, Überwärmte Haut, Unangenehmer Mundgeruch, Gaumenblutungen. Wenn es ganz schlimm läuft kann es zu Leber oder Nierenschäden kommen.",
               counteraction: "Um Gelbfieber zu verhindern sollte man sich Impfen lassen. Außerdem sollte man darauf achten, dass man lange Sachen an hat und Mückenschutzmittel dabei hat.  Momentan gibt es noch keine direkte Behandlung von Gelbfieber. Das einzige was man behandeln kann die einzelnen Symptome. "+
                              "Also je nachdem ob man nun Fieber oder Schmerzen hat werden Medikamente eingesetzt die die Schmerzen lindern."
)

Disease.create(name: "Malaria",
               what: "Malaria ist eine Tropische bis Subtropische Infektionskrankheit. Ausgelöst wird Malaria durch Parasiten. In Europa kommt diese Krankheit also eher unwahrscheinlich vor.",
               infection: "In den meisten Fällen wird die Krankheit durch Insektenstiche verbreitet.",
               symptom: "Typische Symptome wären: Fieber, Gliederschmerzen, Durchfall, Übelkeit, Erbrechen, Schwindel, Kopfschmerzen.",
               counteraction: "Es werden Blutuntersuchungen durchgeführt und diese dann auch ausgewertet. Die Behandlung wird nach Art der Malaria durchgeführt. Dabei wird natürlich auch auf Allergien usw. geachtet. Des weiteren wird empfohlen Medikamente für auftretende Symptome zu nehmen und den Körper viel schonen."
)


Disease.create(name: "Tollwut",
               what: "Diese Krankheit ist eine Viruserkrankung. Sie wird Vorwiegend von Tieren durch Bisse übertragen. Befallen wird dabei das Zentrale Nervensystem. Im Durchschnitt braucht die Krankheit drei bis 8 Wochen bis zum Ausbruch.",
               infection: "Die Krankheit wird über den Speichel der infizierten Tiere auf den Menschen über Bisse übertragen. Außerdem kann auch über eine Hautverletzung eine Infektion stattfinden. Tiere die infiziert sind, verlieren die Scheu zu Menschen",
               symptom: "In der ersten Phase kann es zu Kopfschmerzen, Übelkeit, Erbrechen, Bauchschmerzen,Fieber und auch Husten kommen. In der zweiten Phase entwickelt der Patient eine Wasserphobie. Er wird auch aufhören zu Trinken und den Speichel zu schlucken. In der letzten Phase fällt der Kranke ins Koma und wird höchstwahrscheinlich auch sterben. Bei frühzeitiger Behandlung ist Krankheit meistens schon während der ersten Phase besiegt.",
               counteraction: "Um Tollwut Vorzubeugen empfiehlt sich eine Impfung. Nach einem Tierbiss (Tiere in freier Wildbahn) ist der Besuch beim Arzt auf  jedenfall Pflicht. Die Bissstelle muss sofort gereinigt werden. Wenn man noch nicht geimpft ist, wird diese dann nachgeholt. Treten bereits erste Symptome auf hilft die Medizin nicht mehr gegen die Tollwut. Die Symptome werden dann werden Therapiert."
)


Disease.create(name:  "Windpocken",
               what: "Windpocken sind im allgemeinen eine Viruserkrankung. Die Infizierung wird durch das Varizella Zoster Virus ausgelöst. In erster Linie ist dies eine Kinderkrankheit, sie kann aber auch in jedem Alter auftreten. Wenn man sie einmal hatte, ist man sein Leben lang Immun dagegen. Es könnte nur im Laufe des Lebens als Gürtelrose auftreten.",
               infection: "Infiziert wird man durch das einatmen bestimmter Tröpfchen, die z.B. durch Husten oder Niesen von erkrankten Personen verbreitet werden. Außerdem durch schmierinfektionen, wie der Kontakt mit Hautbläschen von bereits erkrankten.",
               symptom: "Typische Symptome wären: Unwohlsein, Fieber, Gliederschmerzen, Hautausschlag und Kopfschmerzen.",
               counteraction: "Zum vorbeugen wird eine Impfung empfohlen. Um vor allem den Juckreiz zu lindern werden Hautpflegemittel empfohlen und auch Schmerzmittel. Bei härteren Fällen werden Virushemmende Medikamente verschrieben."
)


Disease.create(name:  "Mumps",
               what: "Mumps ist eine ansteckende Virusinfektion. In erster Linie ist Mumps eine Kinderkrankheit. Auch Erwachsene können erkranken.",
               infection: "Über Tröpfcheninfektion und Speichelkontakt kann man infiziert werden.",
               symptom: "Typisch wären: Appetitmangel, Fieber, Kopfschmerzen, Gliederschmerzen.",
               counteraction: "Eine gezielte Therapie gibt es nicht. Allerdings kann man die Symptome behandeln. Je nachdem welche auftreten werden Schmerzmittel verschrieben. Außerdem ist viel Bettruhe zu empfehlen."
)

