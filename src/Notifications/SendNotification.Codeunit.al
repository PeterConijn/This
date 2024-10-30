namespace PC.This.Notifications;

codeunit 50121 "Send Notification"
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure SendNotification(Notification: Codeunit Notification)
    var
        NotificationToSend: Notification;
        NotificationTxt: Label 'Please check the color of %1 %2 (%3) with system ID %4.', Comment = '%1 = Table Name, %2 = Entity No., %3 = Entity Name or Description, %4 = Entity System ID';
    begin
        NotificationToSend.Id := Notification.GetNotificationId();
        NotificationToSend.Message := StrSubstNo(NotificationTxt, Notification.GetTableName().ToLower(), Notification.GetNo(), Notification.GetNameOrDescription(), Notification.GetSystemId());

        if NotificationToSend.Recall() then;
        NotificationToSend.Send();
    end;
}
