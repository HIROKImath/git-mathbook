module ApplicationHelper
  def page_title
    title = "MathBook" #これがサイトのブランド名
    title = @page_title + " | " + title if @page_title
    title
  end
end

