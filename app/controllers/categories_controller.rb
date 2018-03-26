class CategoriesController < ApplicationRecord
  def parentcat_params
    params.require(:parentcat).permit :name
  end
end
