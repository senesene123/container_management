module Dashboard
  class VegetablesController < Dashboard::BaseController
    def index
      @vegetables = Vegetable.all
      @form = Vegetable.new
    end

    def create
      @vegetable = Vegetable.new(vegetable_id: input_params[:vegetable_id],
                                 vegetable_name: input_params[:vegetable_name])

      @vegetable.save
      @vegetables = Vegetable.all
    end

    def edit
      @vegetable = Vegetable.find_by(vegetable_id: input_params[:id])
    end

    def update
      @vegetable = Vegetable.find_by(vegetable_id: input_params[:id])

      @vegetable.vegetable_name = input_params[:vegetable_name]
      @vegetable.save
      @vegetables = Vegetable.all
    end

    def destroy
      @vegetable = Vegetable.find_by(vegetable_id: input_params[:id])

      @vegetable.destroy
      @vegetables = Vegetable.all
    end

    private

    def input_params
      params.permit(:vegetable_id, :vegetable_name, :id)
    end
  end
end
