require 'redcarpet/compat'
require 'kramdown'
module StudentassignmentsHelper
  def overdue(date, status)
    'class=overdue' if (DateTime.now > date) && (status.eql? "assigned")
  end

  def markup(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(text).html_safe
  end
end
