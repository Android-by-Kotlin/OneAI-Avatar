.class public Landroid/gov/nist/javax/sip/header/CallID;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "CallID.java"

# interfaces
.implements Landroid/javax/sip/header/CallIdHeader;


# static fields
.field public static final NAME_LOWER:Ljava/lang/String;

.field private static final serialVersionUID:J = -0x59b36d79798089d4L


# instance fields
.field protected callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    const-string v0, "Call-ID"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/header/CallID;->NAME_LOWER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 61
    const-string v0, "Call-ID"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 62
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

    .line 141
    const-string v0, "Call-ID"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 142
    new-instance v0, Landroid/gov/nist/javax/sip/header/CallIdentifier;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/header/CallIdentifier;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 143
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 146
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/CallID;

    .line 147
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/CallID;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    if-eqz v1, :cond_0

    .line 148
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CallIdentifier;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/CallIdentifier;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 149
    :cond_0
    return-object v0
.end method

.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/CallID;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 90
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/CallIdentifier;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 93
    :cond_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "other"    # Ljava/lang/Object;

    .line 71
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 73
    :cond_0
    instance-of v0, p1, Landroid/javax/sip/header/CallIdHeader;

    if-eqz v0, :cond_1

    .line 74
    move-object v0, p1

    check-cast v0, Landroid/javax/sip/header/CallIdHeader;

    .line 75
    .local v0, "o":Landroid/javax/sip/header/CallIdHeader;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    return v1

    .line 77
    .end local v0    # "o":Landroid/javax/sip/header/CallIdHeader;
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public getCallId()Ljava/lang/String;
    .locals 1

    .line 102
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/CallID;->encodeBody()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCallIdentifer()Landroid/gov/nist/javax/sip/header/CallIdentifier;
    .locals 1

    .line 110
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    return-object v0
.end method

.method public setCallId(Ljava/lang/String;)V
    .locals 3
    .param p1, "cid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 122
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/CallIdentifier;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/header/CallIdentifier;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    nop

    .line 126
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/text/ParseException;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public setCallIdentifier(Landroid/gov/nist/javax/sip/header/CallIdentifier;)V
    .locals 0
    .param p1, "cid"    # Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 133
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/CallID;->callIdentifier:Landroid/gov/nist/javax/sip/header/CallIdentifier;

    .line 134
    return-void
.end method
