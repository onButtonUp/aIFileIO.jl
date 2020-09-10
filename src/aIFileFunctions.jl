taskSourcePath = "./sourceData"

function log_file(thisMessage::String, returnValue::Int = 0)
## when the log file is first created use append = false . . .
    #    CSV.write("logFile.csv", DataFrame(time = [get_time()], event = [thisMessage], retcode = [returnValue]), append=false)
  if true == taskLoggingOn
    CSV.write("logFile.csv", DataFrame(time = [get_time()], event = [thisMessage], retcode = [returnValue]), append=true)
  end
end

function read_log() logDF = DataFrame()
    logDF = CSV.File("logFile.csv") |> DataFrame
end

function count_log_events()
    logDF = DataFrame()
    logDF = CSV.File("logFile.csv")
    return size(logDF)[1]
end

function process_sourceFolder()
  sourceFiles = read_sourceFolder()
  for sf ∈ sourceFiles
    
    println("file: $sf")
  end
end

function count_CSV_files()

  sourceFiles = read_sourceFolder()
 
  occursin.(r".csv", sourceFiles) |> 
  collect |> 
  sum

end

function count_TXT_files()

  sourceFiles = read_sourceFolder()
 
  occursin.(r".txt", sourceFiles) |> 
  collect |> 
  sum

end

function show_CSV_files()

  sourceFiles = read_sourceFolder()
 
  return occursin.(r".csv", sourceFiles) 

end


function show_TXT_files()

  sourceFiles = read_sourceFolder()
 
  return occursin.(r".txt", sourceFiles)

end

function read_sourceFolder()
    readdir(taskSourcePath)
end

function set_sourcePath(thisPath::String)
    global taskSourcePath = thisPath

    #    taskSourcePath = thisPath
end

function show_sourcePath()
    return taskSourcePath
end
