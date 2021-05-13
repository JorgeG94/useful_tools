

const am_to_shell_mapping = Dict(
  0 => "s",
  1 => "p",
  2 => "d",
  3 => "f",
  4 => "g",
  5 => "h", 
  6 => "i",
  10 => "sp"
  )

const shell_to_contraction_mapping = Dict(
"s" => 26,
"p" => 17, 
"d" => 12,
"f" => 3,
"g" => 1, 
"h" => 1,
"i" => 1,
"sp" => 6
)

const am_to_nfuncs_mapping = Dict(
"s" => 1,
"p" => 3, 
"d" => 6,
"f" => 10,
"g" => 15, 
"h" => 21,
"i" => 28,
"sp" => 4
)


function create_shell(nang_mom::Int64)

println("enum class ShellType {")
for angmom in 0:nang_mom
  if angmom == nang_mom
    angmom = 10
    # account for sp shells
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang] 
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang] 
  end

  println(" // $ang functions ")
  for iter in 1:contr
  if angmom == 10 && iter == contr
    println(ang,"_",iter)
  else
    println(ang,"_",iter,",")
  end
  end
end
println("} // enum class ShellTYpe")
end


function print_default(L::Int64)
ang = am_to_shell_mapping[L]
println("default:")
println(" std::cout << \"Shell contraction level not supported for angular momentum $ang !! \" << std::endl;")
println("exit(1);")
println("} // switch K")
end

function shellpairtype(nang_mom::Int64)
println("enum class ShellPairType {")

for angmom in 0:nang_mom

  if angmom == nang_mom
    angmom = 10
    # account for sp shells
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang] 
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang] 
  end
  if angmom == 10 
    angmom = nang_mom
  end 
  for pair in 0:angmom
    if pair == nang_mom
      pair = 10
      # account for sp shells
      ang_i = am_to_shell_mapping[10]
      contr_i = shell_to_contraction_mapping[ang_i] 
    else
      ang_i = am_to_shell_mapping[pair]
      contr_i = shell_to_contraction_mapping[ang_i] 
    end

    for iteri in 1:contr
      for iterj in iteri:contr_i
	if ang == ang_i == "sp" && iteri == iterj == contr
	  println(ang,ang_i,"_",iteri,"_",iterj)
	else
	  println(ang,ang_i,"_",iteri,"_",iterj,",")
	end 
      end
    end


  end


end

println("} // enum class ShellPairTYpe")
end


function assign_pairtype_func(nang_mom::Int64) 

println("ShellType assign_ShellType(unsigned L, unsigned K) {")
println(" ")
println(" switch (L) {")
println(" ")

for angmom in 0:nang_mom
  if angmom == nang_mom
    angmom = 10
    # account for sp shells
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang] 
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang] 
  end 
  println("case $angmom: ")
  println("switch (K) {") 
  for iter in 1:contr
    println("case ", iter,":")
    println("return ShellType::",ang,"_$iter;")
  end
  print_default(angmom)
end

println("default:")
println(" std::cout << \" Shell angular momentum not supported \" << std::endl;")
println("exit(1);")
println("} //switch (L) ")
println(" ")
println("} // assign_ShellType")
end # assign pair type 

function print_pairtype_func(nang_mom::Int64) 

println("void print_ShellType(ShellType shtype){")
println(" ")
println("switch (shtype) { ")

for angmom in 0:nang_mom
  if angmom == nang_mom
    # account for sp shells
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang] 
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang] 
  end 
  for iter in 1:contr
    println("case ShellType::",ang,"_$iter",":")
    println("std::cout << \" ShellType::",ang,"_$iter \" << std::endl;")
    println("break;")
  end
end

println("default:")
println("std::cout << \" Shell not supported \" << std::endl;")
println("exit(1);")
println("} //switch shtype")
println("} // void print_ShellType")

end #print pairtype func 

function get_am_K(nang_mom::Int64)

println("std::pair<unsigned, unsigned> get_am_K_from_sh_type(ShellType shtype) {")
println("swtich (shtype) {")

for angmom in 0:nang_mom
  if angmom == nang_mom
    angmom = 10
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang]
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang]
  end

  for iter in 1:contr
    println("case ShellType::",ang,"_",iter,":")
    println(" return std::make_pair(",angmom,",",iter,");")
  end

end

println("default:")
println("std::cout << \" Shell not supported \" << std::endl;")
println("exit(1);")
println("} // switch")
println("} // get_am_K_from_sh_type ")

end 

function get_cost(nang_mom::Int64)

println("unsigned get_ShellType_cost(ShellType shtype) {")
println("switch (shtype) {")

for angmom in 0:nang_mom
  if angmom == nang_mom
    angmom = 10
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang]
    nfuncs = am_to_nfuncs_mapping[ang]
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang]
    nfuncs = am_to_nfuncs_mapping[ang]
  end

  for iter in 1:contr
    cost = iter * nfuncs
    println("case ShellType::",ang,"_",iter,":")
    println("return $cost ;")
  end

end

println("default:")
println("std::cout << \" Shell not supported \" << std;:endl;")
println("exit(1);")
println("} // switch")
println("} // get_ShellType_cost ")

end 

function assign_shellpairtype(nang_mom::Int64)

println("ShellPairType assign_ShellPairType(ShellType ish_type, ShellType jsh_type) {")
println(" ")
println(" switch (ish_type) {")

for angmom in 0:nang_mom
  if angmom == nang_mom
    angmom = 10
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang]
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang]
  end

  if angmom == 10 
    angmom = nang_mom
  end 
  #for pair in 0:angmom
    #if pair == nang_mom
    #  pair = 10
      # account for sp shells
    #  ang_i = am_to_shell_mapping[10]
    #  contr_i = shell_to_contraction_mapping[ang_i] 
    #else
    #  ang_i = am_to_shell_mapping[pair]
    #  contr_i = shell_to_contraction_mapping[ang_i] 
    #end

    for iteri in 1:contr
      println("	case ShellType::",ang,"_",iteri,":")
      println("	  switch (jsh_type) {")
      
      for pair in 0:angmom
        if pair == nang_mom
          pair = 10
          ang_i = am_to_shell_mapping[10]
          contr_i = shell_to_contraction_mapping[ang_i]
        else
          ang_i = am_to_shell_mapping[pair]
          contr_i = shell_to_contraction_mapping[ang_i]
        end #if 

        for iterj in iteri:contr_i
	        println("   case ShellType::",ang_i,"_",iterj,":")
	        if ang == ang_i == "sp" && iteri == iterj == contr
	          println("	return ShellPairType::",ang,ang_i,"_",iteri,"_",iterj)
	        else
	          println("	return ShellPairType::",ang,ang_i,"_",iteri,"_",iterj,";")
	        end

      end # for iterj 
      #println("	  default: ")
      #println("	    print_ShellType(ish_type);")
      #println("	    print_ShellType(jsh_type);")
      #println("	    std::cout << \" Shel pair type not supported \" << std::endl; ")
      #println("	    exit(1);")
      #println("	  } //switch jsh type")
    end
      println("	  default: ")
      println("	    print_ShellType(ish_type);")
      println("	    print_ShellType(jsh_type);")
      println("	    std::cout << \" Shel pair type not supported \" << std::endl; ")
      println("	    exit(1);")
      println("	  } //switch jsh type")

  end # for 2 


end # for angmom 

println("   default: ")
println("     print_ShellType(ish_type);")
println("     print_ShellType(jsh_type);")
println("     std::cout << \" Shel pair type not supported \" << std::endl; ")
println("     exit(1);")
println("   } //switch ish type")
println("   } //function ")

end

function get_shellpairtype_cost(nang_mom::Int64)

println("unsigned get_ShellPairType_cost(ShellPairType type) {")
println(" ")
println(" switch (type) {")

for angmom in 0:nang_mom
  if angmom == nang_mom
    angmom = 10
    ang = am_to_shell_mapping[10]
    contr = shell_to_contraction_mapping[ang]
    nfuncs = am_to_nfuncs_mapping[ang]
  else
    ang = am_to_shell_mapping[angmom]
    contr = shell_to_contraction_mapping[ang]
    nfuncs = am_to_nfuncs_mapping[ang]
  end

  if angmom == 10 
    angmom = nang_mom
  end 
  for pair in 0:angmom
    if pair == nang_mom
      pair = 10
      # account for sp shells
      ang_i = am_to_shell_mapping[10]
      contr_i = shell_to_contraction_mapping[ang_i] 
      nfuncs_i = am_to_nfuncs_mapping[ang]
    else
      ang_i = am_to_shell_mapping[pair]
      contr_i = shell_to_contraction_mapping[ang_i] 
      nfuncs_i = am_to_nfuncs_mapping[ang]
    end

    for iteri in 1:contr
      for iterj in iteri:contr_i
	cost = nfuncs * nfuncs_i * iteri * iterj
	println("   case ShellPairType::",ang,ang_i,"_",iteri,"_",iterj,":")
	if ang == ang_i == "sp" && iteri == iterj == contr
	  println("	return $cost ;")
	else
	  println("	return $cost ;")
	end 
      end
    end

  end # for 2 


end # for angmom 

println(" default: ")
println("   std::cout << \" Shell pair type cost not supported \" << std::endl; ")
println("   exit(1);")
println(" } //switch type")
println("} //function ")

end



print_pairtype_func(7)
shellpairtype(7)
assign_shellpairtype(7)
get_shellpairtype_cost(7)
create_shell(7)
