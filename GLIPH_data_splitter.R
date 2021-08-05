#!/usr/bin/env Rscript

# Author: David M. Louis
# Contact: dmlouis@stanford.edui
# Contact: dmlouis87@gmail.com

############################### Arguments ###############################

# expected format of input file is

cmd_args = commandArgs(trailingOnly = TRUE);
# midread_table_file = cmd_args[6] ???????????

input_file=read.csv(cmd_args, header=T)
# tableLength=length(midread_table[,1])
# print(cmd_args) #prints file name
print(paste0("input length: ", length(rownames(input_file))))
#midread_matrix=data.matrix(midread_table)

############################################################################################
# Analysis Functions
############################################################################################

#split data
data_splitter <- function(df_input) {
  split_data <- df_input$Sample
  # split_data <- gsub("_heart", "", split_data)
  split_data <- gsub("^.*_", "", split_data)
  return(split_data)
}

#Function ends

############################### Analysis  #################################

input_file$disease <- data_splitter(input_file)

############################### Outputs #################################

write.csv(input_file, file = paste0("split_", gsub("^.*/", "", cmd_args)), quote = F, row.names = F)
