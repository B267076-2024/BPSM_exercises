#!/bin/bash
#inputfile == "/blastoutput2.out"
#list the subject accession for all HSPs
rm -f *.exercise.out
grep -v "#" blastoutput2.out | cut -f2 > Sub_accoutput.exercise.out
grep -v "#" blastoutput2.out | cut -f3,4 > Alignment_percent_ID.exercise.out
grep -v "#" blastoutput2.out | awk 'BEGIN{FS="\t";}{if($5 > 20){print $0;}}' > Mismatches.exercise.out
grep -v "#" blastoutput2.out | awk '{if($4 <100 && $5 >20){print $0;}}' > Q4.exercise.out
grep -v "#" blastoutput2.out | awk '($5 <20)' | head -n 20 > Q5.exercise.out
grep -v "#" blastoutput2.out | awk '($4 < 100)' | wc -l > Q6.exercise.out
grep -v "#" blastoutput2.out | sort -k12nr | head -n 10 > Q7.exercise.out
grep -v "#" blastoutput2.out | cut -f2,7 | grep "AEI" | cut -f2 > Q8.exercise.out
grep -v "#" blastoutput2.out | cut -f2 | sort | uniq -c | awk '($1 >1)' | wc -l > Q9.exercise.out
grep -v "#" blastoutput2.out | awk '{
HSP_per=$5/$4*100
print(HSP_per);
}' > Q10.exercise.out