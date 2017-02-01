voter_datafile = File.join(File.dirname(__FILE__), 'voter-data.csv')
voter_data = File.read(voter_datafile)

voters_index = 0
key_index = 0
voters = []

# parsing hash
voter_data.split("\n")[1..-1].each do |record|
  voters[voters_index] = {}
  voter_data.split("\n")[0].split(", ").each do |key|
    voters[voters_index][key] = record.split(", ")[key_index]
    key_index +=1
  end
  key_index = 0
  voters_index += 1
end

# average age
sum = 0
voters.each { |record| sum += record["Age"].to_i }
puts "average age: #{sum / voters.size}"

# average income
sum = 0
voters.each { |record| sum += record["Income"].to_i }
require "./commas.rb"
puts "average income: #{comma(sum / voters.size, "$", "%.2f")}"

# average household
sum = 0
voters.each { |record| sum += record["Household Size"].to_i }
puts "average household: #{sum / voters.size}"

# gender ratios
fm = {"Female" => 0, "Male" => 0, "Unspecified" => 0}
voters.each do |record|
  fm[(record["Gender"])] += 1
end
puts "female ratio: #{fm["Female"] * 100 / voters.size}%"
puts "male ratio: #{fm["Male"] * 100 / voters.size}%"
puts "unspecified ratio: #{fm["Unspecified"] * 100 / voters.size}%"

# education ratios
edu = {"College" => 0, "High School" => 0, "Did Not Complete High School" => 0}
voters.each do |record|
  edu[record["Education"]] += 1
end
puts "college ratio: #{edu["College"] * 100 / voters.size}%"
puts "high school ratio: #{edu["High School"] * 100 / voters.size}%"
puts "did not finish high school ratio: #{edu["Did Not Complete High School"] * 100 / voters.size}%"
