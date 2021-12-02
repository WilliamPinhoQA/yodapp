**Settings**
Documentation           Test Suite for SignUp and register rules

Resource       ${EXECDIR}/resources/base.robot
Library        ${EXECDIR}/resources/factories/users.py
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
    [Tags]    debug

    &{user}        Create Dictionary
    ...            name=Madokami
    ...            email=madokami32@gmail.com
    ...            order=${order[0]}
    ...            ordertype=${ordertype[0]}   
    ...            bdate=dezembro-2029-28  
    ...            instagram=@Madokami
    ...            expected_message=${expected_messages[0]}
    
    Register                        ${user}
    Check Register on Homepage      ${user}               
            

Register a new Padawan
    [Tags]      other 

    &{user}        Create Dictionary
    ...            name=Madokami
    ...            email=madokami32@gmail.com
    ...            order=${order[0]}
    ...            ordertype=${ordertype[1]}   
    ...            bdate=outubro-2004-14  
    ...            instagram=@Madokami
    ...            expected_message=${expected_messages[0]}
    
    Register       ${user}            
   

Register a new Sith

   &{user}        Create Dictionary
    ...            name=Madoka
    ...            email=madoka32@gmail.com
    ...            order=${order[1]}
    ...            ordertype=null   
    ...            bdate=novembro-1991-20  
    ...            instagram=@Madoka
    ...            expected_message=${expected_messages[0]}
    
    Register       ${user}  


Register a new OtherType

    &{user}        Create Dictionary
    ...            name=Sayaka
    ...            email=sayakyo@gmail.com
    ...            order=${order[2]}
    ...            ordertype=null   
    ...            bdate=junho-2012-12  
    ...            instagram= @SadSayaka
    ...            expected_message=${expected_messages[0]}
    
    Register       ${user}  
        
  
Wrong Email Message Should Exist
    [Tags]      wrong
    &{user}        Create Dictionary
    ...            name=Kyubey
    ...            email=kyubey$kyubey,com
    ...            order=${order[2]}
    ...            ordertype=null   
    ...            bdate=abril-2014-11  
    ...            instagram=@Kyubey
    ...            expected_message=${expected_messages[1]}
    
    Register       ${user}

Import Test Mass With Python File
    ${user}     Factory Yoda

    Register       ${user}
    

