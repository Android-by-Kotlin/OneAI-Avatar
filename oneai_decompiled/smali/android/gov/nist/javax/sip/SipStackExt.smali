.class public interface abstract Landroid/gov/nist/javax/sip/SipStackExt;
.super Ljava/lang/Object;
.source "SipStackExt.java"

# interfaces
.implements Landroid/javax/sip/SipStack;


# virtual methods
.method public abstract getAuthenticationHelper(Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;Landroid/javax/sip/header/HeaderFactory;)Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelper;
.end method

.method public abstract getDialogs()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroid/javax/sip/Dialog;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getJoinDialog(Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;)Landroid/javax/sip/Dialog;
.end method

.method public abstract getLocalAddressForTcpDst(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getLocalAddressForTlsDst(Ljava/net/InetAddress;ILjava/net/InetAddress;)Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getReplacesDialog(Landroid/gov/nist/javax/sip/header/extensions/ReplacesHeader;)Landroid/javax/sip/Dialog;
.end method

.method public abstract getSecureAuthenticationHelper(Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;Landroid/javax/sip/header/HeaderFactory;)Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelper;
.end method

.method public abstract setAddressResolver(Landroid/gov/nist/core/net/AddressResolver;)V
.end method

.method public abstract setEnabledCipherSuites([Ljava/lang/String;)V
.end method
