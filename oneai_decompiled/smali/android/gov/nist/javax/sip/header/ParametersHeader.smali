.class public abstract Landroid/gov/nist/javax/sip/header/ParametersHeader;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "ParametersHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Parameters;
.implements Landroid/gov/nist/javax/sip/header/ParametersExt;
.implements Ljava/io/Serializable;


# instance fields
.field protected duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

.field protected parameters:Landroid/gov/nist/core/NameValueList;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 58
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>()V

    .line 59
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 60
    new-instance v0, Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/DuplicateNameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    .line 61
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "hdrName"    # Ljava/lang/String;

    .line 64
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 65
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 66
    new-instance v0, Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/DuplicateNameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    .line 67
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "hdrName"    # Ljava/lang/String;
    .param p2, "sync"    # Z

    .line 70
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 71
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0, p2}, Landroid/gov/nist/core/NameValueList;-><init>(Z)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 72
    new-instance v0, Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/DuplicateNameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    .line 73
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 469
    invoke-super {p0}, Landroid/gov/nist/javax/sip/header/SIPHeader;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/header/ParametersHeader;

    .line 470
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ParametersHeader;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v1, :cond_0

    .line 471
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1}, Landroid/gov/nist/core/NameValueList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/core/NameValueList;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 472
    :cond_0
    return-object v0
.end method

.method protected abstract encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
.end method

.method protected final equalParameters(Landroid/javax/sip/header/Parameters;)Z
    .locals 8
    .param p1, "other"    # Landroid/javax/sip/header/Parameters;

    .line 582
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 584
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterNames()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5

    .line 585
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 587
    .local v2, "pname":Ljava/lang/String;
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 588
    .local v4, "p1":Ljava/lang/String;
    invoke-interface {p1, v2}, Landroid/javax/sip/header/Parameters;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 592
    .local v5, "p2":Ljava/lang/String;
    if-nez v4, :cond_1

    move v6, v0

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    if-nez v5, :cond_2

    move v7, v0

    goto :goto_2

    :cond_2
    move v7, v3

    :goto_2
    xor-int/2addr v6, v7

    if-eqz v6, :cond_3

    return v3

    .line 593
    :cond_3
    if-eqz v4, :cond_4

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    return v3

    .line 594
    .end local v2    # "pname":Ljava/lang/String;
    .end local v4    # "p1":Ljava/lang/String;
    .end local v5    # "p2":Ljava/lang/String;
    :cond_4
    goto :goto_0

    .line 597
    .end local v1    # "i":Ljava/util/Iterator;
    :cond_5
    invoke-interface {p1}, Landroid/javax/sip/header/Parameters;->getParameterNames()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 598
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 600
    .restart local v2    # "pname":Ljava/lang/String;
    invoke-interface {p1, v2}, Landroid/javax/sip/header/Parameters;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 601
    .restart local v4    # "p1":Ljava/lang/String;
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 610
    .restart local v5    # "p2":Ljava/lang/String;
    if-nez v4, :cond_6

    move v6, v0

    goto :goto_4

    :cond_6
    move v6, v3

    :goto_4
    if-nez v5, :cond_7

    move v7, v0

    goto :goto_5

    :cond_7
    move v7, v3

    :goto_5
    xor-int/2addr v6, v7

    if-eqz v6, :cond_8

    return v3

    .line 611
    :cond_8
    if-eqz v4, :cond_9

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_9

    return v3

    .line 612
    .end local v2    # "pname":Ljava/lang/String;
    .end local v4    # "p1":Ljava/lang/String;
    .end local v5    # "p2":Ljava/lang/String;
    :cond_9
    goto :goto_3

    .line 614
    .end local v1    # "i":Ljava/util/Iterator;
    :cond_a
    return v0
.end method

.method public getMultiParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 508
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/DuplicateNameValueList;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMultiParameterNames()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 536
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/DuplicateNameValueList;->getNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getMultiParameterValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 525
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/DuplicateNameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getMultiParameters()Landroid/gov/nist/core/DuplicateNameValueList;
    .locals 1

    .line 514
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    return-object v0
.end method

.method public getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;
    .locals 1
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 464
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "stripQuotes"    # Z

    .line 89
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/core/NameValueList;->getParameter(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getParameterAsBoolean(Ljava/lang/String;)Z
    .locals 3
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 447
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 448
    .local v0, "val":Ljava/lang/Object;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 449
    return v1

    .line 450
    :cond_0
    instance-of v2, v0, Ljava/lang/Boolean;

    if-eqz v2, :cond_1

    .line 451
    move-object v1, v0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 452
    :cond_1
    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 453
    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 455
    :cond_2
    return v1
.end method

.method protected getParameterAsFloat(Ljava/lang/String;)F
    .locals 2
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 380
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/high16 v1, -0x40800000    # -1.0f

    if-eqz v0, :cond_1

    .line 382
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 383
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0

    .line 385
    :cond_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 388
    :catch_0
    move-exception v0

    .line 389
    .local v0, "ex":Ljava/lang/NumberFormatException;
    return v1

    .line 392
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_1
    return v1
.end method

.method protected getParameterAsHexInt(Ljava/lang/String;)I
    .locals 3
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 355
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 357
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 358
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x10

    invoke-static {v0, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0

    .line 362
    :cond_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 365
    :catch_0
    move-exception v0

    .line 366
    .local v0, "ex":Ljava/lang/NumberFormatException;
    return v1

    .line 369
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_1
    return v1
.end method

.method protected getParameterAsInt(Ljava/lang/String;)I
    .locals 2
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 333
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 335
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 336
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 338
    :cond_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 341
    :catch_0
    move-exception v0

    .line 342
    .local v0, "ex":Ljava/lang/NumberFormatException;
    return v1

    .line 345
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_1
    return v1
.end method

.method protected getParameterAsLong(Ljava/lang/String;)J
    .locals 3
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 403
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_1

    .line 405
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 406
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0

    .line 408
    :cond_0
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 411
    :catch_0
    move-exception v0

    .line 412
    .local v0, "ex":Ljava/lang/NumberFormatException;
    return-wide v1

    .line 415
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_1
    return-wide v1
.end method

.method protected getParameterAsURI(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/GenericURI;
    .locals 3
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 427
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/header/ParametersHeader;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 428
    .local v0, "val":Ljava/lang/Object;
    instance-of v1, v0, Landroid/gov/nist/javax/sip/address/GenericURI;

    if-eqz v1, :cond_0

    .line 429
    move-object v1, v0

    check-cast v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    return-object v1

    .line 432
    :cond_0
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/address/GenericURI;

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/gov/nist/javax/sip/address/GenericURI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 433
    :catch_0
    move-exception v1

    .line 435
    .local v1, "ex":Ljava/text/ParseException;
    const/4 v2, 0x0

    return-object v2
.end method

.method public getParameterNames()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->getNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getParameterValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 100
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getParameters()Landroid/gov/nist/core/NameValueList;
    .locals 1

    .line 305
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    return-object v0
.end method

.method public hasMultiParameter(Ljava/lang/String;)Z
    .locals 1
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 568
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/DuplicateNameValueList;->hasNameValue(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasMultiParameters()Z
    .locals 1

    .line 545
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/DuplicateNameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasParameter(Ljava/lang/String;)Z
    .locals 1
    .param p1, "parameterName"    # Ljava/lang/String;

    .line 290
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->hasNameValue(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasParameters()Z
    .locals 1

    .line 120
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0}, Landroid/gov/nist/core/NameValueList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeMultiParameter(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 557
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/DuplicateNameValueList;->delete(Ljava/lang/String;)Z

    .line 558
    return-void
.end method

.method public removeMultiParameters()V
    .locals 1

    .line 575
    new-instance v0, Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/DuplicateNameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    .line 576
    return-void
.end method

.method public removeParameter(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 132
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->delete(Ljava/lang/String;)Z

    .line 133
    return-void
.end method

.method public removeParameters()V
    .locals 1

    .line 297
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 298
    return-void
.end method

.method public setMultiParameter(Landroid/gov/nist/core/NameValue;)V
    .locals 1
    .param p1, "nameValue"    # Landroid/gov/nist/core/NameValue;

    .line 499
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/DuplicateNameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 500
    return-void
.end method

.method public setMultiParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 488
    new-instance v0, Landroid/gov/nist/core/NameValue;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValue;-><init>()V

    .line 489
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValue;->setName(Ljava/lang/String;)V

    .line 490
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->setValue(Ljava/lang/String;)Ljava/lang/String;

    .line 491
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->duplicates:Landroid/gov/nist/core/DuplicateNameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/DuplicateNameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 492
    return-void
.end method

.method public setParameter(Landroid/gov/nist/core/NameValue;)V
    .locals 1
    .param p1, "nameValue"    # Landroid/gov/nist/core/NameValue;

    .line 313
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 314
    return-void
.end method

.method protected setParameter(Ljava/lang/String;F)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # F

    .line 250
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 251
    .local v0, "val":Ljava/lang/Float;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, p1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v1

    .line 252
    .local v1, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v1, :cond_0

    .line 253
    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 255
    :cond_0
    new-instance v2, Landroid/gov/nist/core/NameValue;

    invoke-direct {v2, p1, v0}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v1, v2

    .line 256
    iget-object v2, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v2, v1}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 258
    :goto_0
    return-void
.end method

.method protected setParameter(Ljava/lang/String;I)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 210
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 211
    .local v0, "val":Ljava/lang/Integer;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, p1, v0}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 213
    return-void
.end method

.method protected setParameter(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 279
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1, p2}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 280
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 154
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 155
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v0, :cond_0

    .line 156
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 158
    :cond_0
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    .line 159
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 161
    :goto_0
    return-void
.end method

.method protected setParameter(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 231
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 232
    .local v0, "val":Ljava/lang/Boolean;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, p1, v0}, Landroid/gov/nist/core/NameValueList;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 233
    return-void
.end method

.method public setParameters(Landroid/gov/nist/core/NameValueList;)V
    .locals 0
    .param p1, "parameters"    # Landroid/gov/nist/core/NameValueList;

    .line 322
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    .line 323
    return-void
.end method

.method public setQuotedParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 183
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/NameValueList;->getNameValue(Ljava/lang/String;)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 184
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {v0, p2}, Landroid/gov/nist/core/NameValue;->setValueAsObject(Ljava/lang/Object;)V

    .line 186
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V

    goto :goto_0

    .line 188
    :cond_0
    new-instance v1, Landroid/gov/nist/core/NameValue;

    invoke-direct {v1, p1, p2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v1

    .line 189
    invoke-virtual {v0}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V

    .line 190
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ParametersHeader;->parameters:Landroid/gov/nist/core/NameValueList;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 192
    :goto_0
    return-void
.end method
