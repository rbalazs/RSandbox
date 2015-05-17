pollutantmean <- function(directory, pollutant, id = 1:332) {
    # Load files by given ids with fix length.
    filePathList <- lapply(id, function(monitor_id) paste(directory, "/", sprintf("%03d.csv", monitor_id), sep=""))
	
    # Load datas.
    datas <- do.call(rbind, lapply(filePathList, read.csv))
	
    mean(datas[,pollutant], na.rm = TRUE)
}
