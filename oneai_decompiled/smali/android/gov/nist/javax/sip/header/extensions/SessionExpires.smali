.class public final Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "SessionExpires.java"

# interfaces
.implements Landroid/javax/sip/header/ExtensionHeader;
.implements Landroid/gov/nist/javax/sip/header/extensions/SessionExpiresHeader;


# static fields
.field public static final NAME:Ljava/lang/String; = "Session-Expires"

.field public static final REFRESHER:Ljava/lang/String; = "refresher"

.field private static final serialVersionUID:J = 0x79a63e78c9b0a324L


# instance fields
.field public expires:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    const-string/jumbo v0, "Session-Expires"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method


# virtual methods
.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 86
    iget v0, p0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->expires:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 89
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 92
    :cond_0
    return-object p1
.end method

.method public getExpires()I
    .locals 1

    .line 53
    iget v0, p0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->expires:I

    return v0
.end method

.method public getRefresher()Ljava/lang/String;
    .locals 2

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "refresher"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/NameValueList;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setExpires(I)V
    .locals 3
    .param p1, "expires"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 69
    if-ltz p1, :cond_0

    .line 71
    iput p1, p0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->expires:I

    .line 72
    return-void

    .line 70
    :cond_0
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad argument "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRefresher(Ljava/lang/String;)V
    .locals 2
    .param p1, "refresher"    # Ljava/lang/String;

    .line 100
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->parameters:Landroid/gov/nist/core/NameValueList;

    const-string/jumbo v1, "refresher"

    invoke-virtual {v0, v1, p1}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 76
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
