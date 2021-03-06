feature 'Message' do
  scenario 'booking for a room allows us to send a message' do
    sign_up
    click_button('Sign up')
    add_space
    click_button('Show list of spaces')
    click_button('Book')
    fill_in('book_from', with: '01/06/2017')
    fill_in('book_to', with: '02/06/2017')
    click_button('Make a booking')
    expect(page.status_code).to eq 200
    fill_in('message', with: 'Hi, my name is Prabu
            and I would like to book your space')
    click_button('Send Message')
    expect(page).to have_content('Message sent!')
  end

  # scenario 'user can send a message to themselves' do
  #   sign_up
  #   click_button('Sign up')
  #   add_space
  #   click_button('Show list of spaces')
  #   click_button('Book')
  #   fill_in('book_from', with: '01/06/2017')
  #   fill_in('book_to', with: '02/06/2017')
  #   click_button('Make a booking')
  #   fill_in('message', with: 'Hi, my name is Prabu
  #           and I would like to book your space')
  #   click_button('Send Message')
  #   visit('/inbox')
  #   expect(status_code).to eq(200)
  #   expect(page).to have_content('Hi, my name is Prabu
  #                                and I would like to book your space')
  # end
  scenario 'user can see their received messages in an inbox' do
    sign_up
    click_button('Sign up')
    Message.create(text: 'hi', sender_id: '2', receiver_id: '1', type: 'request')
    visit '/login'
    fill_in('username', with: 'hermano')
    fill_in('password', with: 'abc123')
    click_button('Login')
    visit('/inbox')
    expect(page).to have_content('My Messages')
  end
end
