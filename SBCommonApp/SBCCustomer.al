tableextension 55000 SBCCustomer extends Customer
{
    fields
    {
        field(55000; SBName; Text[100])
        {
            Caption = 'SB Name';
            OptimizeForTextSearch = true;
        }
    }

    trigger OnInsert()
    begin
        if Rec.Name <> '' then
            Rec.SBName := CopyStr('SB' + Rec.Name, 1, MaxStrLen(Rec.SBName));
    end;

    trigger OnModify()
    begin
        if Rec.Name <> '' then
            Rec.SBName := CopyStr('SB' + Rec.Name, 1, MaxStrLen(Rec.SBName));
    end;
}