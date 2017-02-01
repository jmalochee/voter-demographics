# num = number to be formatted
# sym = use quoted currency symbol to add currenct after negative
# disp = format number with sprintf argument

def comma(num, sym = "", disp = "")

  if disp != ""  # sprintf
    num = disp % num
  end

  num = num.to_s  # allow string manipulation

  if num[0] == "-"  # handle negatives
    neg = "-"
    num = num[1..-1]
  else
    neg = ""
  end

  if num[/\D/].nil?  # if string is all digits
      dec = ""
    elsif num[/\D/] == "."  # if string is all digits with decimal
      dec = num[num.index(".")..-1]  #isolate decimal value
      num = num.to_i.to_s
    else
      puts "invalid input"
  end

  commas = ((num.length - 1) / 3).to_i  # identify no. of commas/loops needed

  while commas > 0 do
    seg = num[-3,3]  #isolate one segment at a time
    final = "," + seg + final.to_s  # reconstructing final output
    num = num[0..-4]  # take remaining input
    commas -= 1  # click
  end

  final = neg + sym + num + final.to_s + dec  # final reconstruction

end
