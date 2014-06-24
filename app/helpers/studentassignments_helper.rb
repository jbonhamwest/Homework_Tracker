module StudentassignmentsHelper
  def overdue(date, status)
    'class=overdue' if (DateTime.now > date) && (status.eql? "assigned")
  end
end
