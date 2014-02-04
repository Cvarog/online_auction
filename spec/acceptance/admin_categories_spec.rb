require 'spec_helper'

feature "Admin work with categories! " do 
  background { admin_session }

  let(:category) { create(:category) }

  context "Admin go to categories index, " do
    background do
      3.times { create(:category) }
      visit admin_categories_path
    end

    scenario "view all categories" do
      Category.all.each do |i|
        expect(page).to have_content(i.name)
      end
    end
  end  
  context "Admin create new category " do
    background { visit new_admin_category_path }

    scenario "with valid params" do
      fill_in 'category[name]', with: 'Мультимедиа111'
      expect { click_on('Save') }.to change(Category, :count).by(+1)
      expect(current_path).to eq(admin_category_path(Category.last))
    end

    scenario "with attached image" do
      fill_in 'category[name]', with: 'Категория'
      attach_file "category[picture]", "#{Rails.root}/app/assets/images/no_image.jpg"
      expect { click_on('Save') }.to change(Category, :count).by(+1)
      expect(current_path).to eq(admin_category_path(Category.last))
    end

    scenario "with invalid data" do
      fill_in 'category[name]', with: 'Ка'
      expect { click_on('Save') }.not_to change(Category, :count)
      expect(page).to have_content("Add a new Category")
    end
  end
  context 'Admin take a look at the category, ' do
    let(:category) { FactoryGirl.create(:category) }

    background { visit admin_category_path(category) }

    scenario "show category" do
      expect(page).to have_content(category.name)
    end

    scenario "push delete button" do
      visit admin_categories_path
      expect { click_on('Delete') }.to change(Category, :count).by(-1)
    end
  end
end
