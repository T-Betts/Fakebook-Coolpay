feature 'Add Recipient' do
  scenario 'Add a recipient to Coolpay API' do
    visit('/')
    click_button "View/Create Recipients"
    fill_in 'username', with: 'Test Recipient'
    click_button 'Submit'
    expect(page).to have_content('"name":"Test Recipient"')
  end
end
