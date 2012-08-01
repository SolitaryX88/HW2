class MoviesController < ApplicationController
  
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
#if params[:sort]!= nil
      @movies = Movie.order(params[:sort])
      @hash = header_class(params[:sort])
#   else
#   @movies = Movie.all
#   end
  end
  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def header_class(header)
    hash = Hash.new(0)
    if header == "title"
      return hash = {:title => "hilite", :release_date => nil}
    elsif header == "release_date"
      return hash = {:title => nil, :release_date => "hilite"}
    else
      return hash = {:title => nil, :release_date => nil}
    end
  end
end
