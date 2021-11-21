**Settings**
Resource       base.robot
Test Setup     Start SignUp Session
Test Teardown  End Session  

**Variables**
@{ORDER}=       Jedi                Sith        Outros
@{ORDERTYPE}=   Cavaleiro Jedi      Padawan

**Keywords**


Register
    [Arguments]         ${name}     ${email}    ${order}     ${ordertype}    ${instagram}    ${month}
    ...     ${year}     ${day}

    Get Text                                css=.input[placeholder="Nome completo"]
    #Fill Text   id=nome     Madokami
    Fill Text                               css=.input[placeholder="Nome completo"]     ${name}
    Fill Text                               css=.input[placeholder="Email"]             ${email}
    Select Options By                       css=.ordem select    text    ${order}
    IF  "${order}" == "Jedi"
        IF  "${ordertype}" == "Cavaleiro Jedi"
            Click                      xpath=//input[@value="Cavaleiro Jedi"]/..//span[@class="check"]
        ELSE 
            Click                      xpath=//input[@value="Padawan"]/..//span[@class="check"]
        END
    END
    Select Birth Date                       ${month}    ${year}     ${day}
    Fill Text                               css=.input[placeholder="Instagram"]         ${instagram}
    Check Checkbox                          xpath=//input[@type="checkbox"]/..//span[@class="check"]
    Click                                   button >> text=Cadastrar
    Wait for Elements State                 xpath=//div[@role="alert"] >> text=Usuário cadastrado com sucesso!
    ...    visible  5      

Select Birth Date

    [Arguments]         ${month}        ${year}     ${day}
        Click       css=.input[placeholder="Data de nascimento"]
    Select Options By                       xpath=(//header[@class="datepicker-header"]//select)[1]
    ...     text     ${month}
     Select Options By                      xpath=(//header[@class="datepicker-header"]//select)[2]
    ...     value    ${year}
    Click                                   xpath=//a[contains(@class,"datepicker-cell")]//span[text()="${day}"]    


**Test Cases**
Logo Should Exist
  
    Get Text    xpath=//img[@alt='Yodapp']
    Get Text    xpath=//img[@src='/img/logo.ebf4d880.svg']

Register a new Jedi Knight
    [Tags]      debug
    Register    Madokami    madokami32@gmail.com    ${order[0]}      ${ordertype[0]}     @Madokami
    ...     outubro    2004    14


Register a new Padawan
    [Tags]      debug
    Register    Madokami    madokami32@gmail.com    ${order[0]}      ${ordertype[1]}     @Madokami
    ...     outubro    2004    14

Register a new Sith
 
    Register    Madoka   madoka32@gmail.com    ${order[1]}     null     @Madoka
    ...     novembro    1991    20

Register a new OtherType
    
    Register    Sayaka    sayakyo@gmail.com    ${order[2]}     null     @SadSayaka
    ...     junho    2012    12

    
    

   

Options Should Exist
     ${v}=   Set Variable    1    
    FOR     ${order}    IN  @{ORDER}
        Log     ${order}
        Get Text  css=.ordem option[value="${v}"]    equal    ${order}
        ${v}=   Evaluate    ${v} + 1
    END