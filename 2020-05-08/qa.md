# Questions and answers

## Saunak Sen

An edited version of the questions and comments submitted in the chat box follows.  Only comments/questions that contribute new information or insight are included.  Readers are encourages to contribute to the discussion by utilizing the issues section.

> From Laura Saba : Here is the link to Dr. Sen’s documents https://github.com/OSGA-OPAR/quant-genetics-webinars

> From Joe Nadeau : Questions: Does randomization establish causality, or association, because all factors that differ are not known or cannot be measured. Same with differences. Isn’t an assumption made that they are identical except for the factor being tested. For example, microbiome, parental effects, other subtle microenvironmental differences. Both the test for differences and randomization are powerful,  but I would think it would be hard to claim causality unless one can show that the underlying assumptions are true (or reasonably true).

> Also, how to handle multiple phenotypes?

Yes, absolutely.  Here the genetic randomization is happening naturally and unlike randomized trials, it is not a random assignment by the investigator/experimenter.  So, first we have to accept (assume) that the genetic randomization is occurring as we are assuming it is.  We have to also be prepared to accept that the assumptions that ensure the validity of the causal diagram are met.  For example, if there is any phenotype-based selection, that diagram would be invalid.  It is worth noting that the genetic randomization balances factors at the time of randomization (in this case, meiosis); downstream factors are not balanced by this approach.  Finally, it is worth noting that some factors, such as the microbiome may be considered (highly multivariate) mediators, and how to incorporate that information remains an open and challenging problem.

Sometimes, it is not clear if a trait is a mediator or part of the phenotype.  For example, in a diabetes study, if fasting blood glucose is the primary trait, is body weight a mediator or part of the phenotype?  Depending on one's point of view, or purpose, one may want to treat body weight and glucose levels as a single unit (multivariate trait).

Readers might also want to read this [excellent article](https://www.ncbi.nlm.nih.gov/pubmed/12952877) by Dr. Nadeau and colleagues.

> From Megan Hagenauer : What do the white sections in the genotype data mean?

The white sections indicate missing data.

> From Ciyang Wang : Hi, I’m wondering for association study, do we add mediator into the linear mode, e.g., as covariate?

How to do mediation is a field by itself!  The traditional way to perform a mediation analysis is to fit two models of the outcome (phenotype) on the predictor (genotype) with and without the mediator, and to examine how the strength of association changes.  In the extreme case, if a mediator completely mediates the effect of genotype on phenotype, the regression coefficient of the phenotype on genotype vanishes conditional on the mediator.  A more thoughtful modern approach has recently appeared in the causal inference literature.  It requires the practitioner to think more carefully about the assumptions involved.  See [Vanderweele (2015)](https://www.annualreviews.org/doi/full/10.1146/annurev-publhealth-032315-021402) for a good introduction.

> From Ryan Underwood : which R package(s) is he using?

The analysis was performed using [R/qtl](http://www.rqtl.org) in a [Jupyter](https://jupyter.org) notebook.

> From Megan Hagenauer : General question: How do you know what density of markers is optimal for a particular experiment?

Simple answer: Markers should be at least 20cM apart for most biparental experimental crosses.  The essential idea is that you should have enough marker density to capture recombination events in the population. This is not an issue with modern genotype technologies in most model organisms.  For organisms or populations with less developed resources, this may require additional effort.  

Some populations such as multiparental crosses (eg. DO, HS, CC), outbred stocks, advanced intercross lines, will require a higher marker density to capture recombination events.  Those crosses, when they detect QTL can offer greater fine-mapping resolution.

- [Svenson (2012)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3276626/)
- [Valdar (2006)](https://www.ncbi.nlm.nih.gov/pubmed/16361245)
- [Sen (2007)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2366108/)

>  From Megan Hagenauer : Wouldn’t genetic sex be a mediator instead of a co-variate?

In general, whether a variable should be considered as a mediator or a covariate, depends on the analyst's conceptualization of the causal relationships between the variables under consideration.

I agree with you that there is some ambiguity regarding how sex should be treated.  We can think of sex as a genetic factor, or we can think of it as a phenotype that depends on genetic elements on the X chromosome (and perhaps elsewhere).  In the latter case, sex might be considered a mediator.

If we consider sex to be determined by the X chromosome alone, then for all autosomal loci genotypes will be approximately independent of sex (or X chromosome genotype).  The causal diagram would look like this (here I am assuming that the autosomal marker and QTL are on the same and therefore meiosis connects them both; sex is not connected to the autosomal QTL because meiosis on different chromosomes is approximately independent).

        --------> Autosomal Marker .............
       |               |                       :
       |               |                       :
    Meiosis -----> Autosomal QTL ---------> Phenotype
	                                           ^
                                               |
                     Sex ----------------------

In this setting, the role of sex is more similar to a covariate (cf. the causal diagram for a covariate).

> From Milad Mortazavi : How would you adjust for sex in the permutation test?

You can use stratified permutations in R/qtl using the `perm.strata` option of the `scanone` function. If you turn on the `perm.Xsp` option, it will perform permutations stratified by cross direction and sex for X chromosome loci.  This option generally doubles the computational effort, and is turned off by default.  Please refer to [Broman (2006)]() for details.

> From Laura Saba : We will get to these sex questions, soon.

:)

> From Milad Mortazavi : Is linear regression more powerful or less than permutation test?

Permutation test is a obtain valid p-values of a test, which can be regression based, or a heuristic-based.  A key assumption is that units (or subsets of units) should be exchangable under the null hypothesis; those units are permuted in the permutation test.  In the genome scan case, under the null hypothesis of no association between any genotype and phenotype, individuals are exhangable, and thus they can be permuted.

The power of the permutation test depends on the test statistic used.  In genome scans we generally use regression-based tests (ANOVA, likelihood ratio), and these will likely have the best power when the trait has a symmetric unimodal distribution (hence the desirability of trait transformations).  We can use any other test statistic (such as a t-test, a ranksum test, or any other heuristic-based test).  These will be likely have less power than the standard LOD score (likelihood ratio) if the trait is symmetric unimodal, but may be better in other scenarios when that assumption is grossly violated.

The main purpose of the permutation test is to control the genome-wide false positive rate (i.e. to give you a valid p-value).  It will do so regardless of the test statistic you use, as long as it is reasonable to assume exchangability under the null hypothesis of no association.

> From Wei-Zen Wei : Please send reference about X chromosome.

[Broman (2006)](https://www.ncbi.nlm.nih.gov/pubmed/17028340)

> From Wei-Zen Wei : Can you discuss the difference between DO QTL and QTL/2?

[DOQTL](https://bioconductor.riken.jp/packages/3.0/bioc/html/DOQTL.html) is a R software package designed for the Diversity Outcross (DO) mice, which is a multi-parental multi-generational mouse cross.

[R/qtl2](https://kbroman.org/qtl2/) is a R software package designed for QTL analysis with high-dimensional traits and complex cross designs including the DO.  It can handle other cross designs such as the Collaborative Cross (CC) that are outside the scope of DOQTL.

If you are analyzing data from DO mice or a similar cross, then look at both packages.  Otherwise, on R/qtl2 or R/qtl (for simpler crosses and low-dimensional traits) are more useful.

> From Amelia Lalou : Could you explain again the adjustment for genetic relatedness? How do you know if you have to correct for this?

Standard QTL analysis assumes that the genetic structure of the population is such that individuals are approximately equally related to each other.  For some cross designs such as advanced intercrosses, and heterogeneous stocks, some individuals are more closely related to their immediate family members (because of the multi-generational crossing strategy).  Even when there is no major locus on a give chromosome of interest, background genetic loci (on other chromosomes) will be more similar in family members than non-family members; this induces a trait correlation between family members.  Linear mixed models (LMMs) are designed to account for this trait correlation structure.

There is a huge literature on this topic. We hope to provide a more comprehensive answer at a future webinar. Stay tuned.

- [Kang (2010)](https://www.nature.com/articles/ng.548)
- [Yu (2005)](https://www.nature.com/articles/ng1702)

> From M. Imad Damaj : So should we do a separate QTL analysis for male and female animals to detect sex-dependent QTLs?

In most cases, my recommendation is to run two analyses, one for main effect QTL (loci that show an effect averaged over males and females), and a second one for QTL-sex interactions (loci whose effect is different in males and females). The main advantage of this approach is that it uses the full sample (increased power), and separates the inferential task cleanly (one for overall main effects, another for interactions).  The main disadvantage is that you have to assume that the error variance is same or similar in both sexes (usually not problem), and some people find this analysis hard to understand (this is the main disadvantage).

> From Kuang Wei : 1. Please comment the proper sample size for this QTL analysis to be meaningful. 2. How does sample size affect the LOD score and significance level, if any? 3. What's rule of thumb a meaningful LOD score, e.g., 4.5, 6, 8, ...be?

(1) As with any other kind of study, the proper sample size is not known in advance.  However, we can make some educated guesses, if we have information about the trait under study.  For a QTL study, important considerations to consider include what strains to study, what kind of cross or population to phenotype, genotyping and phenotyping strategies.  I have a few papers with my opinions.

- [Sen (2005)](https://www.ncbi.nlm.nih.gov/pubmed/15781700)
- [Sen (2007)](https://www.ncbi.nlm.nih.gov/pubmed/17347894)

(2) Generally, the expected LOD score is approximately proportional to the sample size (fixing the effect size, and cross/population).  The genome-wide significance threshold is independent of sample size (fixing marker density).

(3) The genome-wide LOD threshold depends on the cross/population and the trait distribution.  You can get approximations (using theoretical calculations) from the [R/qtlDesign package](https://CRAN.R-project.org/package=qtlDesign).

> From Milad Mortazavi : what is the difference between using genomic relatedness matrix and principal component in LMM?

See [Price (2010)](https://www.nature.com/articles/nrg2813) for a discussion of this issue.

> From Xusheng Wang : Can any statistical algorithm can be used for modeling mediator other than the covariance analysis?

See question from Ciyang Wang above for approaches.  It is an active research area of causal inference.
