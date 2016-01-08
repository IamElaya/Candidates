# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    if id == candidate[:id]
      return candidate
    end
  end
end

def experienced?(candidate)
  return candidate[:years_of_experience] >= 2
end

def enoughpoints?(candidate)
  return candidate[:github_points] >= 100
end

def language?(candidate) 
  return candidate[:languages] =~ "Ruby" || "Python" 
end

def applied?(candidate)
  return candidate[:date_applied] <= 15
end

def age?(candidate)
  return candidate[:age] >= 18
end

def qualified_candidates(candidates)
  qualified_candidates = []

  @candidates.each do |candidate|
    if ((experienced?(candidate)) && (enoughpoints?(candidate)) && (language?(candidate)) && (applied?(candidate)) && (age?(cadidate)))
    qualified_candidates << candidate
     # if candidate[:years_of_experience] >= 2 && candidate[:github_points]>=100 && candidate[:date_applied] <= 15 && candidate[:age] >=18 && candidate[:languages] =~ "Ruby" || "Python"
     #  return candidate
    end
  end
  return qualified_candidates
end



def ordered_by_qualifications
 puts @candidates.sort_by {|candidates, v| [candidates[:years_of_experience], candidates[:github_points]]  }.reverse 
end


  
def menu
  prompt = "> "
  puts "What do you want to know?"
  print prompt
  
  while say = gets.chomp
  case say
  when "find 1"
    @candidates.each do |candidate|
      if candidate[:id] == 1
    return candidate
  end
end
    print prompt
  when "all"
    @candidates.each do |candidate| 
      print candidate
  end
     print prompt
  when "qualified"
     qualified_candidates(@candidates).sort_by!{|candidates, v| [candidates[:years_of_experience], candidates[:github_points]]  }.reverse 
     print prompt
  when "quit"
    puts "end program"
     break
  else
    puts "please input something"
     print prompt
end
 end
end
# Run our method
menu
  
