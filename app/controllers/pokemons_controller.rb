class PokemonsController < ApplicationController
  def capture
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.trainer_id = current_trainer.id
  	@pokemon.save
  	# Pokemon.find(params[:id]).trainer_id = current_trainer.id
  	redirect_to root_path
  end

  def new
  	@pokemon = Pokemon.new 
  end


  def create
  	@pokemon = Pokemon.create(pokemon_params)
  	@pokemon.trainer = current_trainer
  	@pokemon.health = 100
  	@pokemon.level = 1
  	if @pokemon.save
  	  redirect_to current_trainer
  	else
  	  flash[:error] = @pokemon.errors.full_messages.to_sentence
      render "new"
    end
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.health -= 10
  	if @pokemon.health <= 0
  		@pokemon.destroy
  	else 
  		@pokemon.save
  	end
  	redirect_to current_trainer
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end