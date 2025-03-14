codeunit 85100 SBMVendorListTest
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        VendorList: TestPage "Vendor List";
    begin
        VendorList.OpenView();
        VendorList.Close();
        if (not MessageDisplayed) then
            ERROR('Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MessageDisplayed := MessageDisplayed or (Message = 'App published: Hello world');
    end;

    var
        MessageDisplayed: Boolean;
}

