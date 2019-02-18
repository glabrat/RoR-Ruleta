require "application_system_test_case"

class RoundsTest < ApplicationSystemTestCase
  setup do
    @round = rounds(:one)
  end

  test "visiting the index" do
    visit rounds_url
    assert_selector "h1", text: "Rounds"
  end

  test "creating a Round" do
    visit rounds_url
    click_on "New Round"

    fill_in "Player bet", with: @round.player_bet
    fill_in "Player final money", with: @round.player_final_money
    fill_in "Player", with: @round.player_id
    fill_in "Player money", with: @round.player_money
    fill_in "Player money bet", with: @round.player_money_bet
    fill_in "Roulette", with: @round.roulette_id
    click_on "Create Round"

    assert_text "Round was successfully created"
    click_on "Back"
  end

  test "updating a Round" do
    visit rounds_url
    click_on "Edit", match: :first

    fill_in "Player bet", with: @round.player_bet
    fill_in "Player final money", with: @round.player_final_money
    fill_in "Player", with: @round.player_id
    fill_in "Player money", with: @round.player_money
    fill_in "Player money bet", with: @round.player_money_bet
    fill_in "Roulette", with: @round.roulette_id
    click_on "Update Round"

    assert_text "Round was successfully updated"
    click_on "Back"
  end

  test "destroying a Round" do
    visit rounds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Round was successfully destroyed"
  end
end
