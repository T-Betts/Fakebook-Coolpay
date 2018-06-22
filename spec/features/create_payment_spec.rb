# feature 'Create Payment' do
#   scenario 'Create a new payment' do
#     visit('/')
#     click_button "View/Create Payments"
#     fill_in 'amount', with: 10
#     fill_in 'currency', with: 'GBP'
#     fill_in 'recipient_id', 'ABC'
#     click_button 'Submit'
#     expect(page).to have_content('"recipient_id":"ABC"')
#   end
# end
