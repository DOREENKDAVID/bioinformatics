#!/usr/bin/bash
# headers of the datasets
grep ">" nrf1_seq.fa nrf1_seqtemp.fa > sequence_names.txt

#lines with mRNA headers
grep "mRNA" sequence_names.txt | wc -l

#lines count without mRNA headers
grep -v "mRNA" sequence_names.txt | wc -l

#lines count without mRNA headers and sequences
grep  -v "mRNA" nrf1_seq.fa nrf1_seqtemp.fa > DNA_sequenes.fa

#lines with mRNA headers and sequences
grep "mRNA" nrf1_seq.fa nrf1_seqtemp.fa > mRNA_sequences.fa

#lines with mRNA headers
grep "mRNA" sequence_names.txt > mRNA.fa

#lines without mRNA headers
grep  -v "mRNA" sequence_names.txt > DNA.fa

#merge two files
cat nrf1_seq.fa nrf1_seqtemp.fa > merged.fa


#unique sequences 
uniq merged.fa > uniq_seq.fa

# Count the total number of nucleotides
grep -v "^>" uniq_seq.fa | tr -d '\n' | wc -c

# Count the frequency of each base
grep -v "^>" uniq_seq.fa | grep -o . | sort | uniq -c

# predicted  files
cut -d' ' -f2 ../Processed_data/merged.fa | grep "PREDICTED" | wc -l
