class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie::RATINGS
    @ratings = @all_ratings
    column = params[:sort_by]
    @movies = Movie.sort_by(column)

    options = []
    options << params[:ratings] && params[:sort_by]

    last_settings = session[:last_settings]


    if params[:sort_by]
      column = params[:sort_by]
    elsif last_settings
      column = last_settings[:sort_by]
    end

    if options[0] != nil
      if params[:ratings] && params[:ratings] != ''
        params[:ratings].class == Array ? @ratings = params[:ratings] : @ratings = params[:ratings].keys
        @movies = @movies.filter_ratings @ratings
      end

      session[:last_settings] = { ratings: @ratings, sort_by: column }

    elsif last_settings && !last_settings.empty?
      flash.keep
      redirect_to movies_path(ratings: last_settings[:ratings], sort_by: last_settings[:sort_by])
      session.delete :last_settings
    end

    if column == 'title'
      @title_class = 'hilite'
      @release_date_class  = 'no_hilite'
    elsif column == 'release_date'
      @title_class = 'no_hilite'
      @release_date_class  = 'hilite'
    else
      @title_class = 'no_hilite'
      @release_date_class  = 'no_hilite'
    end
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

end
