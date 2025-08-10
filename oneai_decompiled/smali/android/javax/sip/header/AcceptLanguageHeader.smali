.class public interface abstract Landroid/javax/sip/header/AcceptLanguageHeader;
.super Ljava/lang/Object;
.source "AcceptLanguageHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final NAME:Ljava/lang/String; = "Accept-Language"


# virtual methods
.method public abstract getAcceptLanguage()Ljava/util/Locale;
.end method

.method public abstract getQValue()F
.end method

.method public abstract setAcceptLanguage(Ljava/util/Locale;)V
.end method

.method public abstract setQValue(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method
