.class public final Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;
.super Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
.source "ReferredBy.java"

# interfaces
.implements Landroid/javax/sip/header/ExtensionHeader;
.implements Landroid/gov/nist/javax/sip/header/extensions/ReferredByHeader;


# static fields
.field public static final NAME:Ljava/lang/String; = "Referred-By"

.field private static final serialVersionUID:J = 0x2b7f6e1819e3cbcbL


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    const-string/jumbo v0, "Referred-By"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;-><init>(Ljava/lang/String;)V

    .line 40
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 53
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    if-nez v0, :cond_0

    .line 54
    const/4 v0, 0x0

    return-object v0

    .line 56
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 57
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/address/AddressImpl;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 60
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->address:Landroid/gov/nist/javax/sip/address/AddressImpl;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/address/AddressImpl;->getAddressType()I

    move-result v0

    if-ne v0, v1, :cond_2

    .line 61
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 65
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 68
    :cond_3
    return-object p1
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 44
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
