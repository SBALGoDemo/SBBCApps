codeunit 85101 SBMCustomerCardTest
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloMessage()
    var
        Customer: Record Customer;
        CustomerCard: TestPage "Customer Card";
    begin
        Customer.Validate(Name, 'BradTest');
        Customer.Insert(true);
        CustomerCard.GoToRecord(Customer);
        CustomerCard.OpenView();
        CustomerCard.Close();
        if (not MessageDisplayed) then
            ERROR('Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MessageDisplayed := MessageDisplayed or (Message = 'Hello SBBradTest');
    end;

    var
        MessageDisplayed: Boolean;
}

