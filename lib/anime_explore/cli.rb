class CLI

    def call
        puts "Welcome to the Anime Explore App!"
        puts "Here you can learn more about which anime is popular as well as some neat data!"
        puts "To begin, please enter a year that you'd like to learn more about below"
        binding.pry
        input = gets.chomp()
    end
end


