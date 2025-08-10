.class public interface abstract Landroid/javax/sip/header/EventHeader;
.super Ljava/lang/Object;
.source "EventHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Event"


# virtual methods
.method public abstract getEventId()Ljava/lang/String;
.end method

.method public abstract getEventType()Ljava/lang/String;
.end method

.method public abstract setEventId(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setEventType(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
