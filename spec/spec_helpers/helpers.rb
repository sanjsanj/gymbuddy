def select_date_and_time(date, options = {})
  field = options[:from]
  select date.strftime('%Y'), :from => "post_day_1i" #year
  select date.strftime('%B'), :from => "post_day_2i" #month
  select date.strftime('%d'), :from => "post_day_3i" #day 
  select date.strftime('%H'), :from => "post_time_4i" #hour
  select date.strftime('%M'), :from => "post_time_5i" #minute
end

def select_date(date, options = {})
  field = options[:from]
  select date.strftime('%Y'), :from => "#{field}_1i" #year
  select date.strftime('%B'), :from => "#{field}_2i" #month
  select date.strftime('%d'), :from => "#{field}_3i" #day 
end
