.class public interface abstract Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;
.super Ljava/lang/Object;
.source "PrivacyHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Privacy"


# virtual methods
.method public abstract getPrivacy()Ljava/lang/String;
.end method

.method public abstract setPrivacy(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
