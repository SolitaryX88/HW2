module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def header_class?(header)
    params[:sort] == header ? "hilite" : nil
  end
end
