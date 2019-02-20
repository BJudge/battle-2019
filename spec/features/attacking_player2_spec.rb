feature 'attack player 2' do
  scenario '' do
    sign_in_and_play
    click_on 'Attack'
    expect(page).to have_content 'Bart attacked Edmund'
  end
end
