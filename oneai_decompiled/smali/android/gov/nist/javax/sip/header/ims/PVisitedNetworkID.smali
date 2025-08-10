.class public Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "PVisitedNetworkID.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# instance fields
.field private isQuoted:Z

.field private networkID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    const-string/jumbo v0, "P-Visited-Network-ID"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/core/Token;)V
    .locals 1
    .param p1, "tok"    # Landroid/gov/nist/core/Token;

    .line 76
    const-string/jumbo v0, "P-Visited-Network-ID"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->setVisitedNetworkID(Ljava/lang/String;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "networkID"    # Ljava/lang/String;

    .line 69
    const-string/jumbo v0, "P-Visited-Network-ID"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->setVisitedNetworkID(Ljava/lang/String;)V

    .line 72
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 158
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;

    .line 159
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->networkID:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 160
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->networkID:Ljava/lang/String;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->networkID:Ljava/lang/String;

    .line 161
    :cond_0
    iget-boolean v1, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->isQuoted:Z

    iput-boolean v1, v0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->isQuoted:Z

    .line 162
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->getVisitedNetworkID()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 88
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->isQuoted:Z

    if-eqz v0, :cond_0

    .line 89
    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->getVisitedNetworkID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->getVisitedNetworkID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 95
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 99
    :cond_2
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 147
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 149
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;

    .line 150
    .local v0, "o":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->getVisitedNetworkID()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;->getVisitedNetworkID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->equalParameters(Landroid/javax/sip/header/Parameters;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 153
    .end local v0    # "o":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDHeader;
    :cond_1
    return v1
.end method

.method public getVisitedNetworkID()Ljava/lang/String;
    .locals 1

    .line 135
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->networkID:Ljava/lang/String;

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 140
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public setVisitedNetworkID(Landroid/gov/nist/core/Token;)V
    .locals 2
    .param p1, "networkID"    # Landroid/gov/nist/core/Token;

    .line 122
    if-eqz p1, :cond_0

    .line 125
    invoke-virtual {p1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->networkID:Ljava/lang/String;

    .line 128
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->isQuoted:Z

    .line 129
    return-void

    .line 123
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, " the networkID parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setVisitedNetworkID(Ljava/lang/String;)V
    .locals 2
    .param p1, "networkID"    # Ljava/lang/String;

    .line 108
    if-eqz p1, :cond_0

    .line 111
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->networkID:Ljava/lang/String;

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->isQuoted:Z

    .line 115
    return-void

    .line 109
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, " the networkID parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
