**Settings**
Documentation   Base hooks
Library         Browser
Library         String

Resource       actions.robot

**Variables**
${url_dev}          https://yodapp-testing.vercel.app
${url_prod}         https://yodapp.vercel.app
@{BROWSER}          chromium        firefox         webkit


**Keywords**
Start Session
    New Browser         ${browser[0]}      #headless=False  #slowMo=00:00:01
    New Page            ${url_dev}

End Session
    Take Screenshot

Start SignUp Session
    New Browser         ${browser[0]}      #headless=False      #lowMo=00:00:01
    New Page            ${url_dev} 
    #Click       css=.is-success >> "Novo"
    Click               text=Novo


