codeunit 85000 "SBCCustomerListTest"
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        CustList: TestPage "Customer List";
    begin
        CustList.OpenView();
        CustList.Close();
        if (not MessageDisplayed) then
            ERROR('Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MessageDisplayed := MessageDisplayed or (Message = 'App published: Hello world');
    end;

    [Test]
    procedure TestSBNameOnInsert()
    var
        Customer: Record Customer;
    begin
        Customer.Validate(Name, 'BradTest');
        Customer.Insert(true);
        if Customer.SBName <> 'SB' + Customer.Name then
            Error(StrSubstNo('SB Name field is %1 but should be %2', Customer.SBName, 'SB' + Customer.Name));
    end;

    [Test]
    procedure TestSBNameOnModify()
    var
        Customer: Record Customer;
    begin
        Customer.Insert(true);
        Customer.Validate(Name, 'BradTest');
        Customer.Modify(true);
        if Customer.SBName <> 'SB' + Customer.Name then
            Error(StrSubstNo('SB Name field is %1 but should be %2', Customer.SBName, 'SB' + Customer.Name));
    end;

    var
        MessageDisplayed: Boolean;
}

