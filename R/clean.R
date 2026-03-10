clean_df <- function(df) {
  df[-1] <- lapply(df[-1], function(x) {
    # Convert to character
    x <- as.character(x)
    # Replace " - " with NA
    x <- ifelse(x == " - " | x == "-", NA, x)
    # Remove periods (thousand separators): "1.719" -> "1719"
    x <- gsub("\\.", "", x)
    # Replace comma with period (decimal): "0,1" -> "0.1"
    x <- gsub(",", ".", x)
    # Convert to numeric
    as.numeric(x)
  })
  return(df)
}