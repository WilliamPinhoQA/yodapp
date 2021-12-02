**Settings**

Resource        ${EXECDIR}/resources/base.robot
Test Setup      Start Session
Test Teardown   End Session

**Test Cases**
Logo Should Exist
  
    Get Text    xpath=//img[@alt='Yodapp']
    Get Text    xpath=//img[@src='/img/logo.ebf4d880.svg']
    
Yodapp Should be online

    Get Title   ==      Yodapp | QAninja

Welcome message Should exist

    #Get Text    id=welcome      ==       Que a Força (qualidade) esteja com você! 
    Wait For Elements State
    ...     css=.navbar-item >> "Que a Força (qualidade) esteja com você!"
    ...     visible     5

    #id=
    #css=
    #xpath=
    #text =     

New Text Button Should Redirect
    [Tags]    debug
    #Get Text    css=.is-success >> "Novo"                                                                      
    Click       text=Novo

    Get url     equal      ${BASE_URL}/new
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...     visible     5   



