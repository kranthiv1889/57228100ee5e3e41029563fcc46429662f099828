TOP_DIR = ${pwd}
THIRD_PARTY = $TOP_DIR/src/third-party
make.contigs(file=stability.files, processors=10)
summary.seqs(fasta=stability.trim.contigs.fasta)
screen.seqs(fasta=stability.trim.contigs.fasta, group=stability.contigs.groups, maxambig=0, maxlength=295)
summary.seqs(fasta=stability.trim.contigs.good.fasta)
unique.seqs(fasta=stability.trim.contigs.good.fasta)
count.seqs(name=stability.trim.contigs.good.names, group=stability.contigs.good.groups)
pcr.seqs(fasta=$THIRD_PARTY/Mothur/silva.nr_v119.align, start=13862, end=23444, keepdots=F, processors=10)
system(mv $THIRD_PARTY/Mothur/silva.nr_v119.pcr.align silva.v4.fasta)
align.seqs(fasta=stability.trim.contigs.good.unique.fasta, reference=silva.v4.fasta)
summary.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table)
screen.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table, summary=stability.trim.contigs.good.unique.summary, start=8, end=9582, maxhomop=8)
summary.seqs(fasta=stability.trim.contigs.good.unique.good.align)
filter.seqs(fasta=stability.trim.contigs.good.unique.good.align, vertical=T, trump=.)
unique.seqs(fasta=stability.trim.contigs.good.unique.good.filter.fasta, count=stability.trim.contigs.good.good.count_table)
classify.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.fasta, count=stability.trim.contigs.good.unique.good.filter.count_table, reference=$THIRD_PARTY/Mothur/silva.nr_v119.align, taxonomy=$THIRD_PARTY/Mothur/silva.nr_v119.tax, cutoff=80)
remove.lineage(fasta=stability.trim.contigs.good.unique.good.filter.unique.fasta, count=stability.trim.contigs.good.unique.good.filter.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.nr_v119.wang.taxonomy, taxon=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota)
dist.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.pick.fasta, cutoff=0.20)
cluster(column=stability.trim.contigs.good.unique.good.filter.unique.pick.dist, count=stability.trim.contigs.good.unique.good.filter.pick.count_table)
make.shared(list=stability.trim.contigs.good.unique.good.filter.unique.pick.an.unique_list.list, count=stability.trim.contigs.good.unique.good.filter.pick.count_table, label=0.03)
classify.otu(list=stability.trim.contigs.good.unique.good.filter.unique.pick.an.unique_list.list, count=stability.trim.contigs.good.unique.good.filter.pick.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.nr_v119.wang.pick.taxonomy, label=0.03)
