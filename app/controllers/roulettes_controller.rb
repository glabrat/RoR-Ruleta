class RoulettesController < ApplicationController
  before_action :set_roulette, only: [:show, :edit, :update, :destroy]

  # GET /roulettes
  # GET /roulettes.json
  def index
    @roulettes = Roulette.all
    @players = Player.all
    @rounds = Round.joins(:roulette)
  end

  # GET /roulettes/1
  # GET /roulettes/1.json
  def show
    @roulettes = Roulette.all
    @players = Player.all
    @rounds = Round.joins(:roulette)
  end

  # GET /roulettes/new
  def new
    @roulette = Roulette.new
  end

  # GET /roulettes/1/edit
  def edit
  end

  # POST /roulettes
  # POST /roulettes.json
  def create
    roulette_game = RouletteGame.new
    roulette_hash_db = Hash.new
    @roulette = Roulette.last
    roulette_number_round = @roulette ? @roulette.number_rounds + 1 : 1
    roulette_hash_db = { :number_rounds => roulette_number_round, :winning_number => roulette_game.spin } 

    @roulette = Roulette.new(roulette_hash_db)

    respond_to do |format|
      if @roulette.save
        make_round_happen
        format.html { redirect_to @roulette, notice: 'Roulette was successfully created.' }
        format.json { render :show, status: :created, location: @roulette }
      else
        format.html { render :new }
        format.json { render json: @roulette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roulettes/1
  # PATCH/PUT /roulettes/1.json
  def update
    respond_to do |format|
      if @roulette.update(roulette_params)
        format.html { redirect_to @roulette, notice: 'Roulette was successfully updated.' }
        format.json { render :show, status: :ok, location: @roulette }
      else
        format.html { render :edit }
        format.json { render json: @roulette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roulettes/1
  # DELETE /roulettes/1.json
  def destroy
    @roulette.destroy
    respond_to do |format|
      format.html { redirect_to roulettes_url, notice: 'Roulette was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_round_happen    
    @players = Player.all
    @roulette_game = RouletteGame.new
    
    @players.each do |player|
      player_money = player.money
      player_money_bet = player_money <= 1000 ? player_money : @roulette_game.random_player_bet(player_money)
      player_bet = @roulette_game.player_bet
      player_money_gained = @roulette_game.win_lose(@roulette.winning_number, player_bet, player_money_bet)
      player_final_money = player_money + player_money_gained
      round_per_player = { :player_money => player_money, :player_money_bet => player_money_bet, :player_bet => player_bet, :player_id => player.id, :roulette_id => @roulette.id, :player_final_money => player_final_money} 

      @round = Round.new(round_per_player)
      if @round.save
        ::Player.update(player.id, :money => player_final_money )
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roulette
      @roulette = Roulette.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roulette_params
      params.permit(:number_rounds, :winning_number)
    end
end
