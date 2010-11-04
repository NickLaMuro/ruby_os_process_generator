puts "Enter the number of processes you want generated:"
num_of_processes = gets.chomp.to_i
puts "Enter the name of the file you want the generated process stored in:"
filename = gets.chomp
process_array = []
num_of_processes.times do |p|
  process_array << [p, rand(50), rand(num_of_processes), rand(99), 0, rand(10)]
  process_array[p][4] = process_array[p][2]+process_array[p][1]+rand(30)
end
process_array.shuffle!
file = File.new(filename, "w")
file.puts("Pid\tBst\tArr\tPri\tDline\tI/O\t")
process_array.each do |p|
  file.puts("#{p[0]}\t#{p[1]}\t#{p[2]}\t#{p[3]}\t#{p[4]}\t#{p[5]}\t")
end
file.close