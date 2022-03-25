package com.example.construct360deg.model;

import java.sql.Date;

public class TimeSlots {
    private int profid;
    private Date date;
    private int tag;
    String [] slots;
    private int slotid;

    public int getSlotid() {
        return slotid;
    }

    public void setSlotid(int slotid) {
        this.slotid = slotid;
    }



    public int getProfid() {
        return profid;
    }

    public void setProfid(int profid) {
        this.profid = profid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTag() {
        return tag;
    }

    public void setTag(int tag) {
        this.tag = tag;
    }

    public String[] getSlots() {
        return slots;
    }

    public void setSlots(String[] slots) {
        this.slots = slots;
    }




}
