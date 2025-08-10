.class public interface abstract Landroid/javax/sip/header/AllowEventsHeader;
.super Ljava/lang/Object;
.source "AllowEventsHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Allow-Events"


# virtual methods
.method public abstract getEventType()Ljava/lang/String;
.end method

.method public abstract setEventType(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
