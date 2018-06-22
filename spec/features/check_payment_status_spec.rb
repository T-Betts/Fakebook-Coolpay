feature 'Check Payment Status' do
  scenario 'Check the status of a payment' do
    visit('/')
    click_button "View/Create Payments"
    fill_in 'payment_id', with 'XYZ'
    click_button 'Submit'
    expect(page).to have_content('Payment Status:')
  end
end
