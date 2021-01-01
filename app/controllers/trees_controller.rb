class TreesController < ApplicationController

  def index
  end

  def show
    get_tree
  end

  def new
    @tree = Tree.new
    @tree.species = Species.new
    @property = Property.find_by(id: params[:property_id])
  end

  def create
    @survey = Survey.find_by(id: params[:survey_id])
    @property = Property.find_by(id: params[:property_id])
    @tree = @property.trees.build(tree_params)
    @tree.user = current_user
    select_or_create_species
    @tree.species = @species
    if @survey
      if @tree.save
        redirect_to @survey
      else
        redirect_to new_property_tree_path(@property, survey: @survey)
      end
    else
      if @tree.save
        redirect_to @tree
      else
        redirect_to new_property_tree_path(@property)
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def choose_property_to_tree
    @properties = current_user.properties.all
  end
  
  private
  
  def tree_params
    params.require(:tree).permit(:name, :species_id)
  end

  def get_tree
    @tree = Tree.find_by(id: params[:id])
  end

  def select_or_create_species
    if params[:tree][:species_id] == "" && params[:tree][:species_attributes][:name] != ""         # If user wants to enter new species
      @species = Species.create(name: params[:tree][:species_attributes][:name])
    elsif params[:tree][:species_id] == "" && params[:tree][:species_attributes][:name] == ""      # If user does not select a species
      @species = Species.find_by_name("Unknown")
    else                                                                                           # If user simply selects from dropdown
      @species = Species.find(params[:tree][:species_id])
    end
  end

  def last_inspection
    @tree.inspections.last
  end

end
