class BirdsController < ApplicationController
  wrap_parameters format: []
  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

   # PATCH /birds/:id
   def update
    bird=Bird.find_by(id: params[:id])
    if bird
      bird.update(bird_params)
      render json: bird
    else
      render json: {error:"Could not find bird"}, status: :not_found
    end  
  end

  def destroy
    bird=Bird.find_by(id: params[:id])
    if bird
      bird.destroy
      head :no_content
    else
      render json: {error: "Bird not found"}, status: :not_found
    end
  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

 

 
end
