library(tidyverse)
library(RColorBrewer)
library(ggthemes)
library(nortest)

####
# below is the basic barplot for the chromosomes (background)
####

genome_base = ggplot(NULL) +
				geom_bar(data = chr_dat, aes(x= chr_name, y= chr_len) , 
							stat='identity', 
							fill='grey80', 
							colour='grey80', 
							width=.2) +
				labs(y = "Base pair position", 
						x = "Arctic charr chromosome") +
				theme_minimal() +
				theme_light() +
				theme(panel.border = element_blank(),
          				panel.grid.major = element_blank(),
         				 panel.grid.minor = element_blank(),
         				 )

#this part gives it a minimal theme to get rid of the grey background etc				
chr_only = genome_base + theme(axis.text.x = element_text(angle = 90, hjust = 1),
					axis.ticks.x=element_blank())
chr_only




#here I add the segments on. the y and yend are the base pair positons
# x and xend are both the chromosome name, it will draw a straight vertical line from
#the start to end and highlight the segments you want

#need a dataframe with the 3 columns only and thats it.
# can split into multiple geom_segment commands if you want to colour stuff differently
icelandic_hot_cold = chr_only + 
			geom_segment(data = icelandic_cold, 
				aes(x=chr_name, xend=chr_name, y=mb_start, yend=mb_end), color='blue', size = 2)

icelandic_hot_cold



#and with scatter plot points

icelandic_hot_cold = chr_only + 
			geom_segment(data = icelandic_cold, 
				aes(x=chr_name, xend=chr_name, y=mb_start, yend=mb_end), color='blue', size = 2) +
			geom_segment(data = icelandic_hot, 
				aes(x=chr_name, xend=chr_name, y=mb_start, yend=mb_end), color='red', size = 2) +
			geom_point(data = icelandic_snps, aes(x=chr_name, y=POS), color="grey20",
										shape=22,
										size=.001,
										alpha = 0.8, 
										position=position_jitter(.2))

icelandic_hot_cold
