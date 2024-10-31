namespace PC.This.Notifications;

codeunit 50126 "Check Color"
{
    procedure CheckColor(Notification: Notification)
    var
        ColorCheckMsg: Label 'The color is fine.';
    begin
        Message(ColorCheckMsg);
    end;
}
