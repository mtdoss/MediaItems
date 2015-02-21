require 'spec_helper'

feature "CRUD of items" do
  let!(:mark) { FactoryGirl.create(:user_mark) }

  before(:each) do
    login_as(mark)
  end

  feature "creating items" do
    it 'should have a page for creating an item' do
      visit new_item_url
      expect(page).to have_content "New Item"
    end 

    it "should show the new item after creation" do
      submit_new_item("Cool cat", "www.coolcatpicture.jpg", :image)
      expect(page).to have_content "Cool cat"
    end
  end

  feature "updating items" do
    let(:item) { FactoryGirl.create(:item, author: mark) }

    it 'should have an edit item page' do
      visit edit_item_url(item)
      expect(page).to have_content "Edit item"
      find_field('item[title]').value.should eq item.title
      find_field('item[url]').value.should eq item.url 
    end

    it 'should show the updated item after edit is saved' do
      visit edit_item_url(item)
      fill_in "item[title]", with: "Silly dog"
      click_button "Update Item"
      expect(page).not_to have_content "Edit item"
      expect(page).to have_content "Silly dog"
      expect(page).to have_content "Item edited!"
    end
  end

  feature "deleting items" do
    it 'should allow the deletion of an item' do
      submit_new_item("Super cool cat", "www.reallycoolcatvideo.jpg", :video)
      visit items_url
      click_button "Delete"
      expect(page).not_to have_content "Super cool cat"
      expect(page).to have_content "Item deleted!"
    end
  end
end
