**Settings**
Documentation           Test Suite for SignUp and register rules

Resource       ${EXECDIR}/resources/base.robot

Test Setup     Start SignUp Session
Test Teardown  End Session  
   
**Test Cases**

Options Should Exist
     ${v}=   Set Variable    1    
    FOR     ${order}    IN  @{ORDER}
        Log     ${order}
        Get Text  css=.ordem option[value="${v}"]    equal    ${order}
        ${v}=   Evaluate    ${v} + 1
    END

Logo Should Exist
  
    Get Text    xpath=//img[@alt='Yodapp']
    Get Text    xpath=//img[@src='/img/logo.ebf4d880.svg']

Register a new Jedi Knight
    
    Register    Madokami    madokami32@gmail.com    ${order[0]}      ${ordertype[0]}     
    ...     outubro-2004-14       @Madokami   ${expected_messages[0]}  

Register a new Padawan
    [Tags]      other
    Register    Madokami    madokami32@gmail.com    ${order[0]}      ${ordertype[1]}     
    ...     outubro-2004-14       @Madokami   ${expected_messages[0]}

Register a new Sith

    Register    Madoka   madoka32@gmail.com    ${order[1]}     null     
    ...     novembro-1991-20      @Madoka     ${expected_messages[0]}

Register a new OtherType
        
    Register    Sayaka    sayakyo@gmail.com    ${order[2]}     null    
    ...     junho-2012-12      @SadSayaka     ${expected_messages[0]}

    
Wrong Email Message Should Exist
    [Tags]      wrong 
    Register  Kyubey  kyubey$kyubey,com  ${order[2]}            null  
    ...     abril-2014-11       @Kyubey       ${expected_messages[1]}  

