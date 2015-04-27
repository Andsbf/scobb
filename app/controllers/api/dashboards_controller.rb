class Api::DashboardsController < ApplicationController

  def index
    total_revenue = Payment.all.pluck(:total).sum
    num_registrations = Registration.count
    capacity_ratio = (((Registration.count+0.0))/Course.all.pluck(:capacity).sum).round(2)
    num_students = (Dependant.count + (Registration.all.where(dependant_id: nil).pluck(:client_id).uniq).length)


    chart1 = {
      labels: Category.all.order('id').pluck('title'),
      datasets: [
        {
          label: "My Second dataset",
          fillColor: "rgba(151,187,205,0.5)",
          strokeColor: "rgba(151,187,205,0.8)",
          highlightFill: "rgba(151,187,205,0.75)",
          highlightStroke: "rgba(151,187,205,1)",
          data: categories_revenue
          }
        ]
        };

    chart2 = {
    labels: registrations_months,
    datasets: [
        {
            label: "My Second dataset",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: registrations_months_values
        }
    ]
};
    render json: {dashboards: [
     {id: 1, 
      total_revenue: total_revenue,
      num_registrations: num_registrations,
      capacity_ratio: capacity_ratio,
      num_students: num_students,
      chart1: chart1,
      chart2: chart2
      }
    ]}
  end


  def categories_revenue
    a = Registration.joins(:payment).joins(:course).select('payments.total,courses.category_id').group('category_id').sum('total').sort
    
    a = a.map do|inside_array|
      inside_array[1].to_i
    end    
    print a
    a
  end

  def registrations_dates
    a = Registration.pluck(:created_at)
    
    months = Hash.new(0)
    a.each do |date|
      display_month = month_name(date.month)
      months["#{date.year},#{display_month}"] += 1
    end
    months.sort
  end

  def registrations_months
    a = registrations_dates
    
    a.map {|month| month[0]}
  end

  def registrations_months_values
    a = registrations_dates
    
    a.map {|month| month[1]}
  end

  def month_name(month_num)
    ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'][month_num-1]
  end
  
end
  