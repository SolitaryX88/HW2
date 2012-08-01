module ApplicationHelper
  def header_class?(header)
    params[:sort] == header ? "hilite" : nil
  end
end
