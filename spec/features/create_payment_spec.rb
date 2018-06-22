# feature 'Add Recipient' do
#   scenario 'Add a recipient to Coolpay API' do
#     visit('/')
#     click_button "View/Create Payments"
#     fill_in 'amount', with: 10
#     fill_in 'currency', with: 'GBP'
#     fill_in 'recipient_id', 'ABC'
#     click_button 'Submit'
#     expect(page).to have_content('"recipient_id":"ABC"')
#   end
# end
