**Settings**
Documentation       Yodapp Custom Actions


**Variables**
@{ORDER}=       Jedi                Sith        Outros
@{ORDERTYPE}=   Cavaleiro Jedi      Padawan
@{EXPECTED_MESSAGES}=    Usuário cadastrado com sucesso!      Oops! O email é incorreto. 
@{MONTHS}=  janeiro         fevereiro         março         abril       maio   
...         junho   julho   agosto  setembro    outubro     novembro    dezembro               


**Keywords**

Register
    [Arguments]         ${user}
    ${register_placeholder}     Set Variable    Han Solo     han.solo@starwars.com    @hansolo
    ${jedi_types}               Set Variable    Cavaleiro Jedi    Padawan
    ${toaster_element}          Set Variable    xpath=//div[@role="alert"]
    #Fill Text   id=nome     Madokami
    Fill Text                               css=.input[placeholder="${register_placeholder[0]}"]             ${user}[name]
    Fill Text                               css=.input[placeholder="${register_placeholder[1]}"]             ${user}[email]
    Select Options By                       css=.ordem select    text    ${user}[order]
    IF  "${user}[order]" == "Jedi"
        IF  "${user}[ordertype]" == "Cavaleiro Jedi"
            Wait for Elements State    xpath=//input[@value="${jedi_types[0]}"]/..//span[@class="check"]
            ...    visible  5
            Click                      xpath=//input[@value="${jedi_types[0]}"]/..//span[@class="check"]
        ELSE
            Wait for Elements State    xpath=//input[@value="${jedi_types[1]}"]/..//span[@class="check"]
            ...    visible  5
            Click                      xpath=//input[@value="${jedi_types[1]}"]/..//span[@class="check"]
        END
    END
    Select Birth Date                       ${user}[bdate]
    Fill Text                               css=.input[placeholder="${register_placeholder[2]}"]         ${user}[instagram]
    Check Checkbox                          xpath=//input[@type="checkbox"]/..//span[@class="check"]
    Click                                   button >> text=Cadastrar
    Wait for Elements State                 ${toaster_element}
    ...    visible  5
    Get Text                                ${toaster_element}     equal    ${user}[expected_message]
    # Validate Toaster
    #${html}     Get Page Source
    #Log         ${html}      

Select Birth Date
    [Arguments]         ${text_date}
    @{DATE} =       Split String        ${text_date}        -
    Wait for Elements State     xpath=//div[@class="datepicker control"]
    Click       xpath=//div[@class="datepicker control"]
    Wait for Elements State                 xpath=(//header[@class="datepicker-header"]//select)[1]
    ...     visible     5
    Select Options By                       xpath=(//header[@class="datepicker-header"]//select)[1]
    ...     text    ${date[0]}
     Select Options By                      xpath=(//header[@class="datepicker-header"]//select)[2]
    ...     value    ${date[1]}
    Click                                   xpath=//a[contains(@class,"datepicker-cell")]//span[text()="${date[2]}"] 

Check Register on Homepage
    [Arguments]         ${user}
         
    ${birthday}     Convert Birth Date     ${user}   
    
    Click       text=Voltar
    Wait for Elements State         css=.carousel-items
    ...     visible     5
    Get Text        xpath=//td[text()=" ${user}[name] "]     
    Get Text        xpath=//td[text()=" ${user}[email] "]       
    Get Text       xpath=//span[text()=" ${birthday} "]
    Get Text        xpath=//td[text()=" ${user}[instagram] "]       

Convert Birth Date
    [Arguments]         ${user}
    ${month_number}     Set Variable    0    
    ${bdate}=    Split String    ${user}[bdate]     -        
    FOR     ${month}       IN      @{MONTHS}
        IF  "${bdate[0]}" == "${month}"
              
             ${month_number} =  Evaluate      ${month_number} + 1
             IF  ${month_number} < 10
                 ${month_number}=    Catenate   SEPARATOR=  0   ${month_number}
             END  
             Exit For Loop
        ELSE
             ${month_number} =  Evaluate      ${month_number} + 1
        END
    END

    ${birthday}    Set Variable    ${bdate[2]}/${month_number}/${bdate[1]}

    [return]    ${birthday}  