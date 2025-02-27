*** Settings ***

Library             Browser
Resource          ../../resources/web/variablesWeb.robot

*** Keywords ***

User Open IDN Times website in chrome
    New Browser                        ${browser}                                        headless=${headless}    
    New Page                           ${url}                                            wait_until=commit


User verify IDN Media Logos
    Wait For Elements State            ${logo}                      visible

User click IDN Media Logos
    Click                              ${logo}

User verify #GenZMemilih Menu
    Wait For Elements State         ${genZMemilihMenu}              visible

User Verify #GenZMemilih Redirect
    Click                              ${genZMemilihMenu}             
    New Page                           ${genZMemilihPage}             wait_until=load
    Wait Until Keyword Succeeds        10s    500ms                   Get Url          
    ${current_url}=                    Get Url
    Should Be Equal                    ${current_url}                ${genZMemilihPage}  
 
User Verify Community Menu
    Wait For Elements State           ${communityMenu}               visible

User Verify Community Redirect
    Click                              ${communityMenu}
    Wait For Elements State            ${logoCommunityPage}    visible    timeout=30s

User Verify News Menu
    Wait For Elements State           ${newsMenu}                    visible

User Verify News Redirect
    Scroll To                                                       ${newsMenu}
    Click                                                           ${newsMenu}
    Wait Until Keyword Succeeds       10s    500ms                   Get Url  
    ${current_url}=                   Get Url
    Should Contain                    ${current_url}                 /news
    Wait For Elements State              ${newsPageIndicator}        visible    timeout=30s

User Verify Trending Topic
    Wait For Elements State    ${trendingTopicSection}    attached    timeout=30s
    Wait For Elements State    ${trendingTopicSection}    visible    timeout=30s

User Verify Ramadan Tag Redirect
    Click                              ${trendingTopicRamadan}             
    New Page                           ${trendingTopicRamadanPage}             wait_until=load
    Wait Until Keyword Succeeds        10s    500ms                   Get Url          
    ${current_url}=                    Get Url
    Should Be Equal                    ${current_url}                ${trendingTopicRamadanPage}  

User Verify headline
    Wait For Elements State            ${headlineSection}            visible

User Verify 5 Articles Exist
    Wait Until Keyword Succeeds    10s    1s    Verify Article Count

Verify Article Count
    ${count}=    Get Element Count    ${dataHeadline}
    Log To Console    Found articles: ${count}
    Should Be True    ${count} == 5    "Expected 5 articles, but found ${count}"

User Verify Article Expands When Selected
    Wait For Elements State              ${titleHeadlineList}           visible   timeout=30s
    Hover                                ${titleHeadlineList}
    Wait For Elements State              ${titleHeadlineMain}           visible   timeout=30s

User Verify Category Is Visible
    Wait For Elements State              ${categoryHeadlineMainbefore}  visible    timeout=10s
    ${category_text}=                    Get Text                       ${categoryHeadlineMainbefore}
    Log                                  "Category text is: ${category_text}"
    Should Not Be Empty                  ${category_text}    "Expected category to be visible, but it is empty"

User Click Article And Verify Navigation
    Wait For Elements State              ${linkHeadlineMain}       visible            timeout=10s
    ${link}=                             Get Attribute             ${linkHeadlineMain}    href
    Set Global Variable                  ${link}  
    Click                                ${linkHeadlineMain}
    Wait Until Keyword Succeeds          10s    1s    Get Url
    ${current_url}=                      Get Url
    Should Be Equal As Strings           ${current_url}    ${link}

User Verify Most Popular News Has 10 Articles
    Wait For Elements State              ${mostPopularNewsSection}    visible        timeout=10s
    ${popularNews}                       Get Element Count            ${dataMostPopularNews}
    Should Be Equal As Numbers           ${popularNews}               10    Expected 10 articles, but found ${popularNews}

User Verify Most Popular News Category Is Visible
    Wait For Elements State              ${categoryMostPopularNews}  visible          timeout=10s
    ${most_popular_news_category_text}=  Get Text                    ${categoryMostPopularNews}
    Should Not Be Empty                  ${most_popular_news_category_text}    "Expected category to be visible, but it is empty"

User Click Most Popular News And Verify Navigation
    ${link}=                           Get Attribute                 ${firstMostPopularNews}    href
    Click                              ${firstMostPopularNews}
    Wait Until Keyword Succeeds        10s    1s                     Get Url
    ${current_url}=                    Get Url
    Should Be Equal As Strings         ${current_url}                ${link}

User Verify Latest News Has 10 Latest News
    Wait For Elements State       ${latestNewsSection}    visible    timeout=30s
    Scroll To Element             ${latestNewsSection}
    Sleep    3s
    Wait For Elements State       ${latestNewsList}    visible    timeout=30s
    ${news_count}=   Get Element Count    ${latestNewsList}
    Log    Found latest news count: ${news_count}
    Should Be True    ${news_count} >= 10   Expected at least 10 articles, but found ${news_count}
    
User Verify First Two Latest News Are Featured
    ${size1}=                          Get Attribute                 ${featuredLatestNews1}    class
    ${size2}=                          Get Attribute                 ${featuredLatestNews2}    class
    Should Contain                     ${size1}                      featured    "First article should be featured"
    Should Contain                     ${size2}                      featured    "Second article should be featured"

User Verify Latest News Category Is Random
    ${category_before}=                Get Text                      ${categoryLatestNews}
    Reload
    Wait For Elements State            ${latestNewsSection}
    ${category_after}=                 Get Text                      ${categoryLatestNews}
    Should Not Be Equal                ${category_before}            ${category_after}    "Expected categories to be different after reload"

User Click First Featured Article And Verify Navigation
    ${link}=                           Get Attribute                 ${featuredLatestNews1}        href
    Click                              ${featuredLatestNews1}
    Wait Until Keyword Succeeds        10s    1s                     Get Url
    ${current_url}=                    Get Url
    Should Be Equal As Strings         ${current_url}                ${link}

User Click Other Latest News And Verify Navigation
    ${link}=                           Get Attribute                 ${regularLatestNews}    href
    Click                              ${regularLatestNews}
    Wait For Navigation                idntimes.com/                 timeout=30s
    ${current_url}=                    Get Url
    Should Contain                     ${current_url}                idntimes.com/

User Verify News Has 10 Articles
    ${news}=                           Get Element Count             ${newsArticleList}
    Should Be True                     ${news} == 10                 "Expected 10 articles, but found ${news}"


User Verify First Two Articles Are Featured
    ${size1}=                          Get Attribute                 ${featuredNews1}    class
    ${size2}=                          Get Attribute                 ${featuredNews2}    class
    Should Contain                     ${size1}                      featured    "First article should be featured"
    Should Contain                     ${size2}                      featured    "Second article should be featured"

User Verify News Category Matches Section Title
    ${category_title}=                 Get Text                      ${categoryNews}
    ${article_category}=               Get Text                      (${newsArticleList}//span[@class='category'])[1]
    Should Be Equal As Strings         ${category_title}             ${article_category}    "News category should match section title"

User Click First Featured News And Verify Navigation
    ${link}=                           Get Attribute                 ${featuredNews1}    href
    Click                              ${featuredNews1}
    Wait Until Keyword Succeeds        10s    1s                     Get Url
    ${current_url}=                    Get Url  
    Should Be Equal As Strings         ${current_url}                ${link}

User Click Other News And Verify Navigation
    ${link}=                           Get Attribute                 ${regularNews}    href
    Click                              ${regularNews}
    Wait For Navigation                idntimes.com/                 timeout=30s
    ${current_url}=                    Get Url
    Should Contain                     ${current_url}                idntimes.com/

User Close Browser
    Close Browser
