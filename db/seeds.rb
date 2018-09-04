require 'csv'
csv_text = File.read(__dir__ + "/Sandwiches3.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
    
Sandwich.create(sandwich_name: row.to_hash["﻿sandwich_name"], ingredients: row.to_hash["ingredients"]) 
end