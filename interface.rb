require_relative 'method'
require_relative 'scraper'

gift_list = {
  'New Laptop' => false,
  'PS5' => false,
  'Nintendo Switch' => true,
  'A ferret' => false,
  'A dog' => false,
  'A new Kindle tablet' => false
}

user_input = nil

p 'Welcome to Your Christmas Gift List'
until user_input == 'quit'
  p 'Please choose your selection [list|add|delete|mark|idea|quit]'
  user_input = gets.chomp

  case user_input
  when 'list'
    display_list(gift_list)
  when 'add'
    p 'What would you like to add?'
    gift = gets.chomp
    gift_list[gift] = false
    p "Added #{gift} to the list."
  when 'delete'
    p 'What would you like to delete from your list?'
    delete_gift = gets.chomp.to_i - 1
    gifts = gift_list.keys
    deleted_gift = gifts[delete_gift]
    gift_list.delete(deleted_gift)
    p "#{deleted_gift} has been deleted from the list"
  when 'mark'
    display_list(gift_list)
    p "Which gift would you like to mark as purchased? Select a number 1 through #{gift_list.size}."
    mark_index = gets.chomp.to_i - 1
    gifts = gift_list.keys
    mark_gift = gifts[mark_index]
    gift_list[mark_gift] = !gift_list[mark_gift]
    p "#{mark_gift} has been updated."
  when 'idea'
    p 'What kind of ideas are searching for from Etsy?'
    search_keyword = gets.chomp
    etsy_results = scrape(search_keyword)
    display_list(etsy_results)
    p 'What gift would you like to import? Select a number 1-5'
    gift_index = gets.chomp.to_i - 1
    etsy_gifts = etsy_results.keys
    gift_idea = etsy_gifts[gift_index]
    gift_list[gift_idea] = false
    p "#{gift_idea} was added to the list!"
  when 'quit'
    puts 'Alright! Goodbye!'
  else
    p 'Sorry, wrong input. Please try again.'
  end
end
