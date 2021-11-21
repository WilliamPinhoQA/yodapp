**Settings**
Documentation   Base hooks
Library         Browser



**Keywords**
Start Session
    New Browser         webkit      headless=False  #slowMo=00:00:01
    New Page    https://yodapp.vercel.app

End Session
    Take Screenshot

Start SignUp Session
    New Browser         webkit      headless=False      slowMo=00:00:01
    New Page    https://yodapp.vercel.app
    #Click       css=.is-success >> "Novo"
    Click       text=Novo


