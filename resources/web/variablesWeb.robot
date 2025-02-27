
*** Variables ***

${browser}                      chromium
${headless}                     False
${url}                          https://www.idntimes.com/
${logo}                         //img[@src='/assets/img/idntimes.png']
${genZMemilihMenu}              //li/a[text()="#GenZMemilih"]
${genZMemilihPage}              https://www.genzmemilih.idntimes.com/
${communityMenu}                [data-testid="menu-community-link"]
${communityPage}                https://community.idntimes.com
${logoCommunityPage}            //img[@alt='IDN Connect Logo']
${newsMenu}                     [data-testid="menu-news-link"]
${newsPageIndicator}            //span[contains(@class, 'page-title') and contains(text(), 'news')]
${newsURL}                      /news
${trendingTopicSection}         id=content-trending-tags
${trendingTopicRamadan}         //a[contains(@class, 'trending-tag-tracker') and contains(text(), 'ramadan')]
${trendingTopicRamadanPage}     https://ramadan.idntimes.com/
${headlineSection}              xpath=//section[@id='headline']
${sideHeadline}                 xpath=//div[@class='side-headline slick-initialized slick-slider']
${dataHeadline}                 xpath=//div[contains(@class, 'side-headline')]//div[contains(@class, 'slick-slide') and contains(@class, 'slick-active')]
${titleHeadlineMainbefore}      xpath=//h3[@data-testid="title-headline1"]
${titleHeadlineList}            xpath=//h3[@data-testid="title-side-headline2"]
${titleHeadlineMain}            xpath=(//h3[@data-testid="title-headline2"])[1]
${categoryHeadlineMainbefore}   xpath=(//span[@data-testid="category-headline1"]/a)[1]
${linkHeadlineMain}             xpath=//div[@data-testid="desc-side-headline2"]/parent::a
${mostPopularNewsSection}       //div[contains(@class, 'list-trending')]
${listMostPopularNews}          ${mostPopularNewsSection}//div[contains(@class, 'slick-track')]
${dataMostPopularNews}          (${listMostPopularNews}//div[contains(@class, 'box-trending')])[position() <= 10]
${categoryMostPopularNews}      (${dataMostPopularNews}//span[@class='category'])[1]
${firstMostPopularNews}         (${dataMostPopularNews}//a)[1]
${latestNewsSection}            xpath=//section[@data-testid='section-latest']
${latestNewsList}               xpath=//section[@data-testid='section-latest']//div[contains(@class, 'box-trending')]
${featuredLatestNews1}          (${latestNewsList}//a)[1]
${featuredLatestNews2}          (${latestNewsList}//a)[2]
${regularLatestNews}            (${latestNewsList}//a)[position()>2]
${categoryLatestNews}           (${latestNewsList}//span[@class='category'])[1]
${newsSection}                 //section[@id='news']
${newsArticleList}             ${newsSection}//div[contains(@class, 'box-trending')]
${featuredNews1}               (${newsArticleList}//a)[1]
${featuredNews2}               (${newsArticleList}//a)[2]
${regularNews}                 (${newsArticleList}//a)[position()>2]
${categoryNews}                ${newsSection}//h2[@class='section-title']/a





