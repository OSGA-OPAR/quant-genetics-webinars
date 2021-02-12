# **A beginner’s guide to bulk RNA-Seq analysis** 

## Laura Saba, PhD

### Materials from Webinar

[Webinar slides](BeginnersRNASeq_webinar.pdf)

### General Papers
Survey of best practices - [Conesa et al 2016](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0881-8)

Introduction to RNA-Seq - [Kukurba and Montgomery 2015](http://cshprotocols.cshlp.org/content/early/2015/04/11/pdb.top084970.full.pdf+html)

### Key References from Presentation

#### Technical Overview

Overview of RNA-Seq - [Pepke et al 2009](http://www.nature.com/nmeth/journal/v6/n11s/full/nmeth.1371.html)

RNA Separation - [Mattick & Makunin 2006](https://academic.oup.com/hmg/article-lookup/doi/10.1093/hmg/ddl046)

RNA Separation - [Genomes 2002](https://www.ncbi.nlm.nih.gov/books/NBK21121/)

RNA Separation - [Kukurba and Montgomery 2015](http://cshprotocols.cshlp.org/content/early/2015/04/11/pdb.top084970.full.pdf+html)

Library Preparation - [Corney and Basturea 2013](https://www.labome.com/method/RNA-seq-Using-Next-Generation-Sequencing.html)

Link to Illumina Video - [Illumina Sequencing by Synthesis](https://www.youtube.com/watch?annotation_id=annotation_1533942809&feature=iv&src_vid=HMyCqWhwB8E&v=fCd6B5HRaZ8)

#### Experimental Design
Sequencing Depth - [Sims et al 2014](http://www.nature.com/nrg/journal/v15/n2/full/nrg3642.html)

ERCC Synthetic Spike-Ins - [ThermoFisher](https://www.thermofisher.com/order/catalog/product/4456740)

#### Transcriptome Profiling
**Popular Pipelines**

* CuffLinks Protocol (older Tuxedo Pipeline) - [Trapnell et al 2012](http://www.nature.com/nprot/journal/v7/n3/full/nprot.2012.016.html)
* StringTie Protocol (newer Tuxedo Pipeline) - [Pertea et al 2016](http://www.nature.com/nprot/journal/v11/n9/full/nprot.2016.095.html)

#### Trimming
* [cutadapt](http://cutadapt.readthedocs.io/en/stable/index.html)
* Quality-based Trimming Recommendations - [Williams et al 2016](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-0956-2)

#### Read Alignment
* [HISAT2](https://ccb.jhu.edu/software/hisat2/index.shtml)
* [SAMtools](http://www.htslib.org/)
* [SAM format](https://samtools.github.io/hts-specs/SAMv1.pdf)
* [Decoding SAM flags](https://broadinstitute.github.io/picard/explain-flags.html)

#### Transcript Discovery
* [StringTie](https://ccb.jhu.edu/software/stringtie/)
* [GTF File Format](http://mblab.wustl.edu/GTF2.html)
* For visualization - [UCSC Genome Browser](http://genome.ucsc.edu/index.html)

#### Quantification
* [RSEM](https://deweylab.github.io/RSEM/)
* [RUVSeq](https://bioconductor.org/packages/release/bioc/html/RUVSeq.html)

#### Differential Expression
[DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html)

[False Discovery Rate](https://www.jstor.org/stable/2346101?seq=1#page_scan_tab_contents)

Alternative splicing - [MISO](https://miso.readthedocs.io/en/fastmiso/)

Alternative polyadenylation - [DaPars](https://github.com/ZhengXia/dapars)

### Additional References
Influence of RNA extraction - [Sultan et al 2014](http://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-15-675)

RNA-Seq Power Analyses/Sample Size Calculations - [Ching et al 2014](http://rnajournal.cshlp.org/content/early/2014/09/22/rna.046011.114)

RNA-Seq Power Analyses/Sample Size Calculations - [Bi and Lui 2016](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-0994-9)

RNA-Seq Power Analyses/Sample Size Calculations - [Busby et al 2013](https://academic.oup.com/bioinformatics/article-lookup/doi/10.1093/bioinformatics/btt015)

ERCC Synthetic Spike-Ins for RNA-Seq - [Jiang et al 2011](http://genome.cshlp.org/content/21/9/1543.long)

