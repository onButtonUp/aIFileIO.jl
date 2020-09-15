function get_file_symbols(thisFile::String)
    return Symbol.(readdlm(show_sourcePath() * "/$thisFile", '\t', String, '\n')[1,:])
end