.class public interface abstract Landroid/javax/sip/address/AddressFactory;
.super Ljava/lang/Object;
.source "AddressFactory.java"


# virtual methods
.method public abstract createAddress(Landroid/javax/sip/address/URI;)Landroid/javax/sip/address/Address;
.end method

.method public abstract createAddress(Ljava/lang/String;)Landroid/javax/sip/address/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createAddress(Ljava/lang/String;Landroid/javax/sip/address/URI;)Landroid/javax/sip/address/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createSipURI(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/address/SipURI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createTelURL(Ljava/lang/String;)Landroid/javax/sip/address/TelURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createURI(Ljava/lang/String;)Landroid/javax/sip/address/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
