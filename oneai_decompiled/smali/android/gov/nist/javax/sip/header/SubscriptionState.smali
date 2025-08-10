.class public Landroid/gov/nist/javax/sip/header/SubscriptionState;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "SubscriptionState.java"

# interfaces
.implements Landroid/javax/sip/header/SubscriptionStateHeader;


# static fields
.field private static final serialVersionUID:J = -0x5c9e37cd95983a79L


# instance fields
.field protected expires:I

.field protected reasonCode:Ljava/lang/String;

.field protected retryAfter:I

.field protected state:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    const-string/jumbo v0, "Subscription-State"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 60
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->expires:I

    .line 61
    iput v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->retryAfter:I

    .line 62
    return-void
.end method


# virtual methods
.method public encodeBody()Ljava/lang/String;
    .locals 1

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/SubscriptionState;->encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 171
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->state:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->state:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->reasonCode:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 174
    const-string v0, ";reason="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->reasonCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    :cond_1
    iget v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->expires:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 176
    const-string v0, ";expires="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->expires:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    :cond_2
    iget v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->retryAfter:I

    if-eq v0, v1, :cond_3

    .line 178
    const-string v0, ";retry-after="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->retryAfter:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    :cond_3
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 181
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 184
    :cond_4
    return-object p1
.end method

.method public getExpires()I
    .locals 1

    .line 86
    iget v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->expires:I

    return v0
.end method

.method public getReasonCode()Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->reasonCode:Ljava/lang/String;

    return-object v0
.end method

.method public getRetryAfter()I
    .locals 1

    .line 111
    iget v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->retryAfter:I

    return v0
.end method

.method public getState()Ljava/lang/String;
    .locals 1

    .line 145
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->state:Ljava/lang/String;

    return-object v0
.end method

.method public setExpires(I)V
    .locals 2
    .param p1, "expires"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 72
    if-ltz p1, :cond_0

    .line 76
    iput p1, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->expires:I

    .line 77
    return-void

    .line 73
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, SubscriptionState, setExpires(), the expires parameter is  < 0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setReasonCode(Ljava/lang/String;)V
    .locals 2
    .param p1, "reasonCode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 132
    if-eqz p1, :cond_0

    .line 136
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->reasonCode:Ljava/lang/String;

    .line 137
    return-void

    .line 133
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, SubscriptionState, setReasonCode(), the reasonCode parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRetryAfter(I)V
    .locals 2
    .param p1, "retryAfter"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 97
    if-lez p1, :cond_0

    .line 101
    iput p1, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->retryAfter:I

    .line 102
    return-void

    .line 98
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string v1, "JAIN-SIP Exception, SubscriptionState, setRetryAfter(), the retryAfter parameter is <=0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setState(Ljava/lang/String;)V
    .locals 2
    .param p1, "state"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 156
    if-eqz p1, :cond_0

    .line 160
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/SubscriptionState;->state:Ljava/lang/String;

    .line 161
    return-void

    .line 157
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception, SubscriptionState, setState(), the state parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
