.class public Landroid/gov/nist/javax/sip/header/Organization;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "Organization.java"

# interfaces
.implements Landroid/javax/sip/header/OrganizationHeader;


# static fields
.field private static final serialVersionUID:J = -0x2682caa11d164bc8L


# instance fields
.field protected organization:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 70
    const-string v0, "Organization"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 71
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 63
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Organization;->organization:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getOrganization()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/Organization;->organization:Ljava/lang/String;

    return-object v0
.end method

.method public setOrganization(Ljava/lang/String;)V
    .locals 2
    .param p1, "o"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 86
    if-eqz p1, :cond_0

    .line 90
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/Organization;->organization:Ljava/lang/String;

    .line 91
    return-void

    .line 87
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, Organization, setOrganization(), the organization parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
