require 'spec_helper'

feature "User works with lots" do
  background { user_session }

  let(:lot) { create(:lot) }

  context "User go to lots index, " do
    background do
      3.times { create(:lot) }
      visit lots_path
    end
    
    scenario "view all lots" do
      Lot.all.each do |i| 
      expect(page).to have_content(i.name)
      end
    end

    scenario "view all lots category" do
        expect(page).to have_content("Активные Лоты", "Стартовавшие Лоты", "Завершившиеся Лоты")
    end

    scenario "view single lot " do
      visit lot_path(lot)
      expect(page).to have_content(lot.name, lot.price)
      end
      
    scenario "create bet " do
      visit lot_path(lot)
      expect { click_on('Make a Bet') }.to change(Bet, :count).by(1)
      end

  end
end