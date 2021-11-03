def display_list(gift_list)
  gift_list.each_with_index do |(item, purchased), index|
    x_mark = purchased ? 'X' : ' '
    p "#{index + 1} - [#{x_mark}] #{item}"
  end
end
