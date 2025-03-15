// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 55101 SBMCustomerCard extends "Customer Card"
{
    trigger OnAfterGetCurrRecord()
    begin
        if Rec.SBName <> '' then
            Message('Hello ' + Rec.SBName);
    end;
}