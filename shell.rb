def run(command, input = '')
IO.popen(command, 'r+') do |io |
        io.puts input
    io.close_write
return io.read
end
end
