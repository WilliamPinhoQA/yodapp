**Settings**
Documentation       Yodapp Custom Actions

**Variables**
@{ORDER}=       Jedi                Sith        Outros
@{ORDERTYPE}=   Cavaleiro Jedi      Padawan
@{EXPECTED_MESSAGES}=    "Usuário cadastrado com sucesso!"      "Oops! O email é incorreto." 
@{REGISTER_PLACEHOLDER}=     Han Solo     han.solo@starwars.com    @hansolo
@{JEDI_TYPES}=              Cavaleiro Jedi    Padawan    


**Keywords**

Register
    [Arguments]         ${name}     ${email}    ${order}     ${ordertype}      ${text_date}
    ...                 ${instagram}    ${expected_message}


    #Fill Text   id=nome     Madokami
    Fill Text                               css=.input[placeholder="${register_placeholder[0]}"]             ${name}
    Fill Text                               css=.input[placeholder="${register_placeholder[1]}"]             ${email}
    Select Options By                       css=.ordem select    text    ${order}
    IF  "${order}" == "Jedi"
        IF  "${ordertype}" == "Cavaleiro Jedi"
            Wait for Elements State    xpath=//input[@value="${jedi_types[0]}"]/..//span[@class="check"]
            ...    visible  5
            Click                      xpath=//input[@value="${jedi_types[0]}"]/..//span[@class="check"]
        ELSE
            Wait for Elements State    xpath=//input[@value="${jedi_types[1]}"]/..//span[@class="check"]
            ...    visible  5
            Click                      xpath=//input[@value="${jedi_types[1]}"]/..//span[@class="check"]
        END
    END
    Select Birth Date                       ${text_date}
    Fill Text                               css=.input[placeholder="${register_placeholder[2]}"]         ${instagram}
    Check Checkbox                          xpath=//input[@type="checkbox"]/..//span[@class="check"]
    Click                                   button >> text=Cadastrar
    Wait for Elements State                 xpath=//div[@role="alert"] >> text=${expected_message}
    ...    visible  5
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