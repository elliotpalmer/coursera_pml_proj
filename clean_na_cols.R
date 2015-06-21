#Clean_up_data

## Cycle through each column and delete columns with Majority NA values

clean_na_cols <- function(x, p = .9) {

  k <- as.numeric(vector())
  
  for(i in 1:length(x)){
      
      na_count <- sum(is.na(x[,i]))
      blnk_cnt <- sum(x[,i]=="")
      
      col_len <- length(x[,i])
      
      na_prop <- na_count/col_len
      bl_prop <- blnk_cnt/col_len
      
      print(paste(na_count, na_prop, p))
      
      if(na_prop<p & bl_prop<p){
        k <- rbind(k,i)
      }
      
  }
  
  clean_na_cols <- x[,k]
  
}