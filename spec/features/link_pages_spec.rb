require "rails_helper"

describe "the add a link feature" do
  it "adds a new link" do
    visit links_path
    click_on "Add link"
    fill_in "Name", :with => "Article"
    fill_in 'Url', :with => "http://article.com"
    click_on 'Create Link'
    expect(page).to have_content "Article"
  end
end

describe "upvoting a link" do
  it "increases the number of upvotes of a link" do
    test_link = Link.create(name: "youhole", url: "youhole.tv")
    visit links_path
    click_on test_link.id
    expect(page).to have_content "1 point"
  end
end

describe "the add a comment feature" do
  it "adds a new comment" do
    test_link = Link.create(:name => "YouHole", :url => "youhole.tv")
    visit links_path
    click_on "comments-#{test_link.id}"
    fill_in "comment_text", :with => "jesus what a horrible website 0/10 would not website again"
    click_on 'Create Comment'
    expect(page).to have_content "jesus"
  end
end
