**Settings**
Documentation   Test Suite to check if app is online or not
Library         Browser

**Test Cases**
Yodapp Should be online
    New Browser         webkit      headless=False  slowMo=00:00:01
    New Page    https://yodapp.vercel.app
    Get Title   ==      Yodapp | QAninja

    Take Screenshot
