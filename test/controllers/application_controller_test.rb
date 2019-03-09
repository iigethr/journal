# frozen_string_literal: true

require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get root path" do
    get root_path
    assert_response :success
  end

  test "should get meta tags" do
    get root_path
    assert_response :success
    # Base
    assert_select "title"
    assert_select "link[rel='canonical']"
    # Meta tags
    assert_select "meta" do
      # Base
      assert_select "[name='description']"
      # Opengraph
      assert_select "[property='og:title']"
      assert_select "[property='og:description']"
      assert_select "[property='og:type']"
      assert_select "[property='og:url']"
      assert_select "[property='og:image']"
      # Twitter
      assert_select "[name='twitter:card']"
      assert_select "[name='twitter:site']"
      assert_select "[name='twitter:creator']"
      assert_select "[name='twitter:title']"
      assert_select "[name='twitter:description']"
      assert_select "[name='twitter:image']"
    end
  end

  test "should get favicons" do
    get root_path
    assert_response :success
    assert_select "link" do
      assert_select "[type='image/png'][sizes='16x16']"
      assert_select "[type='image/png'][sizes='32x32']"
      assert_select "[type='image/png'][sizes='96x96']"
      assert_select "[type='image/png'][sizes='128x128']"
      assert_select "[type='image/png'][sizes='196x196']"
      assert_select "[type='image/x-icon'][sizes='64x64']"

      assert_select "[rel='apple-touch-icon-precomposed'][sizes='57x57']"
      assert_select "[rel='apple-touch-icon-precomposed'][sizes='60x60']"
      assert_select "[rel='apple-touch-icon-precomposed'][sizes='72x72']"
      assert_select "[rel='apple-touch-icon-precomposed'][sizes='76x76']"
      assert_select "[rel='apple-touch-icon-precomposed'][sizes='114x114']"
      assert_select "[rel='apple-touch-icon-precomposed'][sizes='120x120']"
      assert_select "[rel='apple-touch-icon-precomposed'][sizes='144x144']"
      assert_select "[rel='apple-touch-icon-precomposed'][sizes='152x152']"
    end
    assert_select "meta" do
      assert_select "[name='application-name']"
      assert_select "[name='msapplication-TileColor']"
      assert_select "[name='msapplication-TileImage']"
      assert_select "[name='msapplication-square70x70logo']"
      assert_select "[name='msapplication-square150x150logo']"
      assert_select "[name='msapplication-wide310x150logo']"
      assert_select "[name='msapplication-square310x310logo']"
    end
  end
end
