describe 'Switch turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Bart's turn"
    end
    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_on 'Attack'
      click_on 'OK'
      expect(page).not_to have_content 'Bart'
      expect(page).to have_content "Edmund's turn"
    end
  end
end
