class SurveysController < ApplicationController

  def index
    @surveys = current_user.surveys
  end

  def show
    get_survey
  end

  def new
    @property = Property.find_by(id: params[:property_id])
    @survey = @property.surveys.build
  end

  def create
    @survey = Property.find_by(id: params[:property_id]).surveys.build(survey_params)
    if @survey.save
      redirect_to @survey
    else
      render new_property_survey_path(@survey.property)
    end
  end

  def edit
    @survey = Survey.find_by(id: params[:id])
  end

  def update
    get_survey
    if @survey.update(survey_params)
      redirect_to @survey
    else
      render edit_survey(@survey)
    end
  end

  def delete_survey_confirmation
    @survey = Survey.find_by(id: params[:survey][:id])
  end

  def destroy
    get_survey
    @property = @survey.property
    @survey.delete
    redirect_to property_path(@property)
  end

  def new_survey                                   # Controller Action to initiate process of starting survey prior to choosing property
    @properties = current_user.properties.all
  end
  
  private
  
  def survey_params
    params.require(:survey).permit(:date)
  end

  def get_survey
    @survey = current_user.surveys.find_by(id: params[:id])
  end

end
