class CommandsController < ApplicationController
  before_action :set_game
  
  def index
    @commands = @game.commands
  end
  
  # AJAX
  def create
    @command = @game.commands.new(command_params)
    
    respond_to do |format|
      if @command.save
        @scene = @game.execute(@command.text)
        format.js
      else
        format.js { render inline: "<p>ERROR</p>" }
      end
    end
  end
  
  private
    def set_game
      @game = Game.find(params[:game_id])
    end
  
    def command_params
      params.require(:command).permit(:text)
    end
end