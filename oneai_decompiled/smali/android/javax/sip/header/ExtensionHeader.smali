.class public interface abstract Landroid/javax/sip/header/ExtensionHeader;
.super Ljava/lang/Object;
.source "ExtensionHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# virtual methods
.method public abstract getValue()Ljava/lang/String;
.end method

.method public abstract setValue(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
