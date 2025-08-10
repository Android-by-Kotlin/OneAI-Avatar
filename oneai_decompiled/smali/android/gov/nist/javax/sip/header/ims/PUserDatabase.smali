.class public Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;
.super Landroid/gov/nist/javax/sip/header/ParametersHeader;
.source "PUserDatabase.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/header/ims/PUserDatabaseHeader;
.implements Landroid/gov/nist/javax/sip/header/ims/SIPHeaderNamesIms;
.implements Landroid/javax/sip/header/ExtensionHeader;


# instance fields
.field private databaseName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 54
    const-string/jumbo v0, "P-User-Database"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "databaseName"    # Ljava/lang/String;

    .line 46
    const-string/jumbo v0, "P-User-Database"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;-><init>(Ljava/lang/String;)V

    .line 47
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->databaseName:Ljava/lang/String;

    .line 48
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .line 98
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;

    .line 99
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;
    return-object v0
.end method

.method public encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 77
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->getDatabaseName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->getDatabaseName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 82
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 85
    :cond_1
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 92
    instance-of v0, p1, Landroid/gov/nist/javax/sip/header/ims/PUserDatabaseHeader;

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->databaseName:Ljava/lang/String;

    return-object v0
.end method

.method public setDatabaseName(Ljava/lang/String;)V
    .locals 2
    .param p1, "databaseName"    # Ljava/lang/String;

    .line 64
    if-eqz p1, :cond_1

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 67
    const-string/jumbo v0, "aaa://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->databaseName:Ljava/lang/String;

    goto :goto_0

    .line 70
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ims/PUserDatabase;->databaseName:Ljava/lang/String;

    .line 72
    :goto_0
    return-void

    .line 65
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Database name is null"

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

    .line 103
    new-instance v0, Ljava/text/ParseException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
