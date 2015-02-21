module ItemFeaturesHelper
  def submit_new_item(item_title, item_url, item_type, privacy = {private: false} )
    visit new_item_url
    fill_in "item[title]", with: item_title
    if privacy[:private]
      check "item[private]"
    end

    fill_in "item[url]", with: item_url
    fill_in "item[type]", with: item_type

    click_button "New Item"
  end
end
