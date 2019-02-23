feature 'Attacking' do
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_on 'Attack'
    click_on 'OK'
    expect(page).not_to have_content 'Edmund: 60HP'
    expect(page).to have_content 'Edmund: 50HP'
  end
end
