class WeekPlan < ActiveRecord::Base
  enum weekday: [:mon, :tue, :wed, :thu, :fri, :sat, :sun]
end
