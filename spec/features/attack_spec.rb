feature 'Attacking' do
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_on 'Attack'
    click_on 'OK'
    expect(page).not_to have_content 'Edmund: 60HP'
    expect(page).to have_content 'Edmund: 50HP'
  end
  scenario 'be attacked by Player 2' do
    sign_in_and_play
    click_on 'Attack'
    click_on 'OK'
    click_on 'Attack'
    expect(page).to have_content 'Edmund attacked Bart'
  end
  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    click_on 'Attack'
    click_on 'OK'
    click_on 'Attack'
    click_on 'OK'
    expect(page).not_to have_content 'Bart: 60HP'
    expect(page).to have_content 'Bart: 50HP'  
  end
end
