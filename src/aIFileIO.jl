module aIFileIO

usingDates, CSV, DataFrames

include("AIFileFunctions.jl")

export log_file, read_log, count_log_events, , read_sourceFolder
export process_sourceFolder, count_CSV_files, count_TXT_files, set_sourcePath, show_sourcePath
export show_CSV_files, show_TXT_files

end