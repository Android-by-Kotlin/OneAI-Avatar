.class public interface abstract Landroid/javax/sip/header/ToHeader;
.super Ljava/lang/Object;
.source "ToHeader.java"

# interfaces
.implements Landroid/javax/sip/header/HeaderAddress;
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "To"


# virtual methods
.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getTag()Ljava/lang/String;
.end method

.method public abstract setTag(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
