module Games
  def submit_command(game, command_text)
    visit "/games/#{game.to_param}"
    fill_in 'command[text]', with: command_text
    click_on 'Send'
  end
  
  def start_playing(story)
    visit '/stories'
    within("#story_#{story.id}") do
      click_on 'Play Now'
    end
  end
end

World(Games)