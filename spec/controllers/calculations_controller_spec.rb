require "rails_helper"

RSpec.describe CalculationsController, type: :controller do
  describe "GET new" do
    it "assigns @calculation" do
      get :new
      expect(assigns(:calculation)).to be_a_new(Calculation)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
