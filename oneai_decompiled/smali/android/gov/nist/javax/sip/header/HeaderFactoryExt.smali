.class public interface abstract Landroid/gov/nist/javax/sip/header/HeaderFactoryExt;
.super Ljava/lang/Object;
.source "HeaderFactoryExt.java"

# interfaces
.implements Landroid/javax/sip/header/HeaderFactory;


# virtual methods
.method public abstract createChargingVectorHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PChargingVectorHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createJoinHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createPAccessNetworkInfoHeader()Landroid/gov/nist/javax/sip/header/ims/PAccessNetworkInfoHeader;
.end method

.method public abstract createPAssertedIdentityHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createPAssertedServiceHeader()Landroid/gov/nist/javax/sip/header/ims/PAssertedServiceHeader;
.end method

.method public abstract createPAssociatedURIHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PAssociatedURIHeader;
.end method

.method public abstract createPCalledPartyIDHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PCalledPartyIDHeader;
.end method

.method public abstract createPChargingFunctionAddressesHeader()Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddressesHeader;
.end method

.method public abstract createPMediaAuthorizationHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createPPreferredIdentityHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentityHeader;
.end method

.method public abstract createPPreferredServiceHeader()Landroid/gov/nist/javax/sip/header/ims/PPreferredServiceHeader;
.end method

.method public abstract createPProfileKeyHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PProfileKeyHeader;
.end method

.method public abstract createPServedUserHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PServedUserHeader;
.end method

.method public abstract createPUserDatabaseHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PUserDatabaseHeader;
.end method

.method public abstract createPVisitedNetworkIDHeader()Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;
.end method

.method public abstract createPathHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/PathHeader;
.end method

.method public abstract createPrivacyHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/ims/PrivacyHeader;
.end method

.method public abstract createReferencesHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/extensions/ReferencesHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createReferredByHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/extensions/ReferredByHeader;
.end method

.method public abstract createReplacesHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRequestLine(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SipRequestLine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createSecurityClientHeader()Landroid/gov/nist/javax/sip/header/ims/SecurityClientHeader;
.end method

.method public abstract createSecurityServerHeader()Landroid/gov/nist/javax/sip/header/ims/SecurityServerHeader;
.end method

.method public abstract createSecurityVerifyHeader()Landroid/gov/nist/javax/sip/header/ims/SecurityVerifyHeader;
.end method

.method public abstract createServiceRouteHeader(Landroid/javax/sip/address/Address;)Landroid/gov/nist/javax/sip/header/ims/ServiceRouteHeader;
.end method

.method public abstract createSessionExpiresHeader(I)Landroid/gov/nist/javax/sip/header/extensions/SessionExpiresHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createStatusLine(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SipStatusLine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
