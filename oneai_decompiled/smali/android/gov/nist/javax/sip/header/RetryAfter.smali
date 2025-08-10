.class public Landroid/gov/nist/javax/sip/header/RetryAfter;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "RetryAfter.java"

# interfaces
.implements Landroid/javax/sip/header/RetryAfterHeader;


# static fields
.field public static final DURATION:Ljava/lang/String; = "duration"

.field private static final serialVersionUID:J = -0xe495f10ce4d22dcL


# instance fields
.field protected comment:Ljava/lang/String;

.field protected retryAfter:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 68
    const-string/jumbo v0, "Retry-After"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 59
    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->retryAfter:Ljava/lang/Integer;

    .line 69
    return-void
.end method


# virtual methods
.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 77
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->retryAfter:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->retryAfter:Ljava/lang/Integer;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->comment:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->comment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 84
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 88
    :cond_2
    return-object p1
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .line 147
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getDuration()I
    .locals 2

    .line 189
    const-string/jumbo v0, "duration"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/header/RetryAfter;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v0, -0x1

    return v0

    .line 190
    :cond_0
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getRetryAfter()I
    .locals 1

    .line 136
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->retryAfter:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public hasComment()Z
    .locals 1

    .line 95
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->comment:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeComment()V
    .locals 1

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->comment:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public removeDuration()V
    .locals 1

    .line 107
    const-string/jumbo v0, "duration"

    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->removeParameter(Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 2
    .param p1, "comment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 159
    if-eqz p1, :cond_0

    .line 161
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->comment:Ljava/lang/String;

    .line 162
    return-void

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "the comment parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDuration(I)V
    .locals 2
    .param p1, "duration"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 174
    if-ltz p1, :cond_0

    .line 176
    const-string/jumbo v0, "duration"

    invoke-virtual {p0, v0, p1}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setParameter(Ljava/lang/String;I)V

    .line 177
    return-void

    .line 175
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "the duration parameter is <0"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRetryAfter(I)V
    .locals 3
    .param p1, "retryAfter"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 121
    if-ltz p1, :cond_0

    .line 124
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/RetryAfter;->retryAfter:Ljava/lang/Integer;

    .line 125
    return-void

    .line 122
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalid parameter "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
