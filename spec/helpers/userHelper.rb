module UserHelper

  def sign_up(email = 't@t.com', gender = 'Male')
    visit '/users/sign_up'
    fill_in 'Email', with: email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Name', with: 'George'
    select(gender, :from => 'Gender')
    fill_in 'Fitness bio', with: 'Powerlifting, also light golf'
    select('Beginner', :from => 'Fitness level')
    attach_file('user_image', 'spec/features/images/me.jpg')
    click_button 'Sign up'
  end

  def select_date_and_time(date, options = {})
    field = options[:from]
    select date.strftime('%Y'), :from => "post_day_1i" #year
    select date.strftime('%B'), :from => "post_day_2i" #month
    select date.strftime('%d'), :from => "post_day_3i" #day
    select date.strftime('%H'), :from => "post_time_4i" #hour
    select date.strftime('%M'), :from => "post_time_5i" #minute
  end

  def create_post(activity = 'Swimming')
    visit '/posts'
    click_link 'New Post'
    select activity, from: 'Activity'
    select 'Virgin Active Molegate', from: 'Location'
    select_date_and_time(DateTime.now)
    click_button 'Create Post'
  end
end
