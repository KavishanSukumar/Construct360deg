package com.example.construct360deg.model;

public class Notification {
    private int notificationid;
    private int notifiyeeid;
    private int notifierid;
    private String notificationtype;
    private String notificationmessage;
    private String datetime;

    public int getNotificationid() {
        return notificationid;
    }

    public void setNotificationid(int notificationid) {
        this.notificationid = notificationid;
    }

    public int getNotifiyeeid() {
        return notifiyeeid;
    }

    public void setNotifiyeeid(int notifiyeeid) {
        this.notifiyeeid = notifiyeeid;
    }

    public int getNotifierid() {
        return notifierid;
    }

    public void setNotifierid(int notifierid) {
        this.notifierid = notifierid;
    }

    public String getNotificationtype() {
        return notificationtype;
    }

    public void setNotificationtype(String notificationtype) {
        this.notificationtype = notificationtype;
    }

    public String getNotificationmessage() {
        return notificationmessage;
    }

    public void setNotificationmessage(String notificationmessage) {
        this.notificationmessage = notificationmessage;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }
}
