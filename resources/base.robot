**Settings**
Documentation   Base hooks
Library         Browser
Library         String
Library         DateTime
Library         Collections

Resource       actions.robot

**Variables**
${BASE_URL}          https://yodapp-testing.vercel.app
#${url_prod}         https://yodapp.vercel.app
@{BROWSER}          chromium        firefox         webkit




**Keywords**
Start Session
    New Browser         ${browser[0]}      #headless=False  #slowMo=00:00:01
    New Page            ${BASE_URL}

End Session
    Take Screenshot

Start SignUp Session
    New Browser         ${browser[0]}      #headless=False      #lowMo=00:00:01
    New Page            ${BASE_URL} 
    #Click       css=.is-success >> "Novo"
    Click               text=Novo


