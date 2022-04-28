module RelationshipsSupport
  def chord_create
    visit new_chord_path
    find_by_id("A7").click
    fill_in "chord_title",	with: "ブルース進行"
    fill_in "chord_body",	with: "キーAの王道ブルースです"
    click_button "投稿"
  end
end