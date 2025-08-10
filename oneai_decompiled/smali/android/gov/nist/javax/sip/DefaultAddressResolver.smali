.class public Landroid/gov/nist/javax/sip/DefaultAddressResolver;
.super Ljava/lang/Object;
.source "DefaultAddressResolver.java"

# interfaces
.implements Landroid/gov/nist/core/net/AddressResolver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method


# virtual methods
.method public resolveAddress(Landroid/javax/sip/address/Hop;)Landroid/javax/sip/address/Hop;
    .locals 4
    .param p1, "inputAddress"    # Landroid/javax/sip/address/Hop;

    .line 64
    invoke-interface {p1}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 65
    return-object p1

    .line 67
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/stack/HopImpl;

    invoke-interface {p1}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->getDefaultPort(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1}, Landroid/javax/sip/address/Hop;->getTransport()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/HopImpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v0
.end method
