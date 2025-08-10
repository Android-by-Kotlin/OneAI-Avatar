.class public interface abstract Landroid/javax/sip/header/ContentDispositionHeader;
.super Ljava/lang/Object;
.source "ContentDispositionHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final ALERT:Ljava/lang/String; = "Alert"

.field public static final ICON:Ljava/lang/String; = "Icon"

.field public static final NAME:Ljava/lang/String; = "Content-Disposition"

.field public static final RENDER:Ljava/lang/String; = "Render"

.field public static final SESSION:Ljava/lang/String; = "Session"


# virtual methods
.method public abstract getDispositionType()Ljava/lang/String;
.end method

.method public abstract getHandling()Ljava/lang/String;
.end method

.method public abstract setDispositionType(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setHandling(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
