class GossipsController < ApplicationController

  def index
    @colors = ["blue", "green", "brown", "purple", "orange"]
    @users = User.all
    @titles = Gossip.all
  end

  def show
    @index = Gossip.find(params[:id])
    @user = User.find(@index.user_id)
  end

  def new
    @gossip = Gossip.new()
  end

  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: User.all.sample.id)

    if @gossip.save
      flash[:success] = "Le potin a bien été créé !"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find_by(id: params[:id])

  end

  def update
    @gossip = Gossip.find_by(id: params[:id])
    params_permitted = params.require(:gossip).permit(:title, :content)
    @gossip.update(params_permitted)
  end

end
