require 'spec_helper'

feature "Admin works with lots" do
  background { admin_session }

  let(:lot) { create(:lot) }

  context "Admin go to lots index, " do
    background do
      3.times { create(:lot) }
      visit admin_lots_path
    end
    
    scenario "view all lots" do
      Lot.all.each do |i| 
        expect(page).to have_content(i.name)
      end
    end

    scenario "view single lot " do
      visit admin_lot_path(lot)
      expect(page).to have_content(lot.name, lot.price)
    end

    scenario "delete lot" do
      visit admin_lots_path
      expect{ click_on("Delete", match: :first) }.to change(Lot, :count).by(-1)      
    end
  end

  context "Admin create new lot, " do
    background { visit new_admin_lot_path }

    scenario "with valid params" do
      fill_in 'lot[name]', with: 'My_new_lot'
      fill_in 'lot[description]', with: 'The best planshet in the world ever'
      fill_in 'lot[price]', with: '100'
      # fill_in 'lot[expired_time]', with: '2013-12-11 01:57:12'
      fill_in 'lot[time_step]', with: '30'
      click_on('Save')
      expect(current_path).to eq(admin_lots_path)
      expect(page).to have_content('My_new_lot')
    end

    scenario "with invalid params" do
      fill_in 'lot[name]', with: 'My'
      fill_in 'lot[description]', with: 'The best'
      fill_in 'lot[price]', with: '100'
      # fill_in 'lot[expired_time]', with: '2013-12-11 01:57:12'
      fill_in 'lot[time_step]', with: '30'
      click_on('Save')
      expect { click_on('Save') }.not_to change(Lot, :count)
      expect(page).to have_content('Add a new Lot')
      # expect(page).to have_content('не может быть меньше 3 символа')
    end
  end

  context "Admin edit lot" do
    background { visit edit_admin_lot_path(lot) }

    scenario "with valid params" do
      fill_in 'lot[name]', with: 'My_new_lot'
      fill_in 'lot[description]', with: 'The best planshet in the world ever'
      fill_in 'lot[price]', with: '100'
      # fill_in 'lot[expired_time]', with: '2013-12-11 01:57:12'
      fill_in 'lot[time_step]', with: '30'
      click_on('Save')
      expect(current_path).to eq(admin_lots_path)
      expect(page).to have_content('My_new_lot')
    end
  end

end