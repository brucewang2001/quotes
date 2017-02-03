class ThewordsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # sort reference : http://railscasts.com/episodes/228-sortable-table-columns?autoplay=true
  def index
  	#@thewords = Theword.all
  	#sort_column = sort_column.instance_of?(String) ? sort_column : "sharedate"
  	#sort_direction = sort_direction.instance_of?(String) ? sort_direction : "asc"
  	@thewords = Theword.order(sort_column + " " + sort_direction)
  end
  def new
  	@theword = Theword.new
  end
  def create
  	@theword = Theword.new(theword_param)
  	@theword.save
  	redirect_to :action => :index
  end
  def show
  	@theword = Theword.find(params[:id])
  end
  private
  def theword_param
  	params.require(:theword).permit(:sharedate, :thequote, :review)
  end
  def sort_column
  	Theword.column_names.include?(params[:sort]) ? params[:sort] : "sharedate"
  end
  def sort_direction
  	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
