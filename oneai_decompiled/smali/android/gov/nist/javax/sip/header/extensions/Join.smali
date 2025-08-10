.class public Landroid/gov/nist/javax/sip/header/extensions/Join;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "Join.java"

# interfaces
.implements Landroid/javax/sip/header/ExtensionHeader;
.implements Landroid/gov/nist/javax/sip/header/extensions/JoinHeader;


# static fields
.field public static final NAME:Ljava/lang/String; = "Join"

.field private static final serialVersionUID:J = -0xba8b18cd4310e78L


# instance fields
.field public callId:Ljava/lang/String;

.field public callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    const-string v0, "Join"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "callId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 51
    const-string v0, "Join"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 52
    new-instance v0, Landroid/gov/nist/javax/sip/header/CallIdentifier;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/header/CallIdentifier;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 53
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 60
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->callId:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 61
    return-object p1

    .line 63
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->callId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 65
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 68
    :cond_1
    return-object p1
.end method

.method public getCallId()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->callId:Ljava/lang/String;

    return-object v0
.end method

.method public getCallIdentifer()Landroid/gov/nist/javax/sip/header/CallIdentifier;
    .locals 1

    .line 86
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    return-object v0
.end method

.method public getFromTag()Ljava/lang/String;
    .locals 1

    .line 145
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->parameters:Landroid/gov/nist/core/NameValueList;

    if-nez v0, :cond_0

    .line 146
    const/4 v0, 0x0

    return-object v0

    .line 147
    :cond_0
    const-string/jumbo v0, "from-tag"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/extensions/Join;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getToTag()Ljava/lang/String;
    .locals 1

    .line 113
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->parameters:Landroid/gov/nist/core/NameValueList;

    if-nez v0, :cond_0

    .line 114
    const/4 v0, 0x0

    return-object v0

    .line 115
    :cond_0
    const-string/jumbo v0, "to-tag"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/extensions/Join;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasFromTag()Z
    .locals 1

    .line 164
    const-string/jumbo v0, "from-tag"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/extensions/Join;->hasParameter(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasToTag()Z
    .locals 1

    .line 132
    const-string/jumbo v0, "to-tag"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/extensions/Join;->hasParameter(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeFromTag()V
    .locals 2

    .line 170
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "from-tag"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 171
    return-void
.end method

.method public removeToTag()V
    .locals 2

    .line 138
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "to-tag"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 139
    return-void
.end method

.method public setCallId(Ljava/lang/String;)V
    .locals 0
    .param p1, "cid"    # Ljava/lang/String;

    .line 97
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->callId:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setCallIdentifier(Landroid/gov/nist/javax/sip/header/CallIdentifier;)V
    .locals 0
    .param p1, "cid"    # Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 105
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/extensions/Join;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 106
    return-void
.end method

.method public setFromTag(Ljava/lang/String;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 154
    if-eqz p1, :cond_1

    .line 156
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    const-string/jumbo v0, "from-tag"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/Join;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    return-void

    .line 157
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v1, "bad tag"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 155
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null tag "

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setToTag(Ljava/lang/String;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 122
    if-eqz p1, :cond_1

    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 126
    const-string/jumbo v0, "to-tag"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/extensions/Join;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    return-void

    .line 125
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v1, "bad tag"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 123
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null tag "

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 177
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
