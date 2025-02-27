*** Settings ***
Library             Browser
Resource    ../resources/web/keywordsWeb.robot
Resource    ../resources/web/variablesWeb.robot
Test Setup         Set Browser Timeout    120s

*** Test Cases ***

Verify IDN Times Website Logo
    User Open IDN Times website in chrome
    User verify IDN Media Logos
    User click IDN Media Logos
    User Close Browser

Verify Menu Bar #GenZMemilih
    User Open IDN Times website in chrome
    User verify #GenZMemilih Menu
    User Verify #GenZMemilih Redirect
    User Close Browser

Verify Menu Bar Community Menu
    User Open IDN Times website in chrome
    User Verify Community Menu
    User Verify Community Redirect
    User Close Browser

Verify Menu Bar News Menu
    User Open IDN Times website in chrome
    User Verify News Menu
    User Verify News Redirect
    User Close Browser

Verify Trending Topics
    User Open IDN Times website in chrome
    User Verify Trending Topic
    User Verify Ramadan Tag Redirect
    User Close Browser

Verify Headline Section
    User Open IDN Times website in chrome
    User Verify headline
    User Verify 5 Articles Exist
    User Verify Article Expands When Selected
    User Verify Category Is Visible
    User Click Article And Verify Navigation
    User Close Browser

Verify Most Popular News Section
    User Open IDN Times website in chrome
    User Verify Most Popular News Has 10 Articles
    User Verify Most Popular News Category Is Visible
    User Click Most Popular News And Verify Navigation
    User Close Browser

Verify Latest News Section
    User Open IDN Times website in chrome
    User Verify Latest News Has 10 Latest News
    User Verify First Two Latest News Are Featured
    User Verify Latest News Category Is Random
    User Click First Featured Article And Verify Navigation
    User Click Other Latest News And Verify Navigation
    User Close Browser

Verify General News Section
    User Open IDN Times website in chrome
    User Verify News Has 10 Articles
    User Verify First Two Articles Are Featured
    User Verify News Category Matches Section Title
    User Click First Featured News And Verify Navigation
    User Click Other News And Verify Navigation
    User Close Browser
