require 'spec_helper'

feature "Admin work with items! " do 
  background { admin_session }

  let(:item) { create(:item) }

  context "Admin go to items index, " do
    background do
      3.times { create(:item) }
      visit admin_items_path
    end
    
    scenario "view all items" do
      Item.all.each do |i| 
        expect(page).to have_content(i.name)
      end
    end

    scenario "view single item " do
      visit admin_item_path(item)
      expect(page).to have_content(item.name, item.description)
    end

    scenario "delete item" do
      visit admin_items_path
      expect{ click_on("Delete", match: :first) }.to change(Item, :count).by(-1)      
    end

  end

  context "Admin create new item, " do
    background { visit new_admin_item_path }

    scenario "with valid params" do
      fill_in 'item[name]', with: 'My_new_item'
      fill_in 'item[description]', with: 'The best planshet in the world ever'
      fill_in 'item[price]', with: '100'
      click_on('Save')
      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content('My_new_item')
    end

    scenario "with invalid params" do
      fill_in 'item[name]', with: 'It'
      fill_in 'item[description]', with: 'Description'
      fill_in 'item[price]', with: '100'
      expect { click_on('Save') }.not_to change(Item, :count)
      expect(page).to have_content('Add a new Item')
    end
  end

  context "Admin edit item" do
    background { visit edit_admin_item_path(item) }

    scenario " edit with valid params" do
      fill_in 'item[name]', with: 'My_new_item'
      fill_in 'item[description]', with: 'The best planshet in the world ever'
      fill_in 'item[price]', with: '100'
      click_on('Save')
      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content('My_new_item')
    end
  end
end
