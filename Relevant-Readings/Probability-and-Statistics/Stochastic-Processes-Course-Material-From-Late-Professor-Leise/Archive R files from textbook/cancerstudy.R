# cancerstudy.R
# Example 2.12 and Example 2.18
# Simulate lung cancer growth

mat <- read.csv("lungcancer.csv",header=T)
init <- c(rep(0,22),1,rep(0,27)) # Starting state 23 is Lung
n <- 8
markov(init,mat,n)
 
 ##############################
Metastatic site number system.
  From: "A stochastic Markov chain model to describe lung cancer growth and metastatis" by Newton, et al. PLoS ONE, Volume 7, Issue 4, April 2012, pp 1-18.
  
  1	Adrenal
  2	Anus
  3	Appendix
  4	Bile Duct
  5	Bladder
  6	Bone
  7	Brain
  8	Branchial Cyst
  9	Breast
  10	Cervix
  11	Colon
  12	Diaphragm
  13	Duodenum
  14	Esophagus
  15	Eye	
  16	Gallbladder
  17	Heart
  18	Kidney
  19 Large intestine
  20	Larynx
  21	Lip	
  22	Liver
  23	Lung
  24	Lymph Nodes (reg)
  25	Lymph Nodes (dist)
  26	Omentum
  27	Ovaries	
  28	Pancreas
  29	Penis
  30	Pericardium
  31	Peritoneum
  32	Pharynx
  33	Pleura
  34	Prostate
  35	Rectum
  36	Retroperitoneum
  37	Salivary
  38	Skeletal Muscle
  39	Skin
  40	Small intenstine
  41	Spleen
  42	Stomach
  43	Testes
  44	Thyroid
  45	Tongue
  46	Tonsil
  47	Unknown
  48	Uterus
  49	Vagina
  50	Vulva
  
 
