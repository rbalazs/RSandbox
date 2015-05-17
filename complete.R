
# Complete function
complete <- function(directory, id = 1:3332) {
	# Load file names by given ids with fix length.
 	filePathList <- lapply(id, function(monitor_id) paste(directory, "/", sprintf("%03d.csv", monitor_id), sep=""))

	# Combine rows from csv files.
	datas <- do.call(rbind, lapply(filePathList, read.csv))

	# Get complete cases (named integers).
	summarized_data <- sapply(split(datas, datas$ID), my_summarize)

	# This way we get the original order.
	summarized_data <- summarized_data[(match(id, names(summarized_data)))]
	
	# Create the final data frame. 
	complete_data_frame = data.frame(id = names(summarized_data), nobs = summarized_data)

	# Set row names to indexes (legth of the id parameter).
	row.names(complete_data_frame) <- 1:length(id)

	complete_data_frame
}

# Returns number of complete cases in the given group.
my_summarize <- function(group) {
	sum(complete.cases(group))
}

