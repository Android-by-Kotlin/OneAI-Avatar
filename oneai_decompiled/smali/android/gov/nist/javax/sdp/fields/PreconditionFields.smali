.class public Landroid/gov/nist/javax/sdp/fields/PreconditionFields;
.super Ljava/lang/Object;
.source "PreconditionFields.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DIRECTION:[Ljava/lang/String;

.field public static final DIRECTION_NONE:I = 0x0

.field public static final DIRECTION_RECV:I = 0x2

.field public static final DIRECTION_SEND:I = 0x1

.field public static final DIRECTION_SENDRECV:I = 0x3

.field public static final PRECONDITION:[Ljava/lang/String;

.field public static final PRECONDITION_QOS:I = 0x0

.field public static final STATUS:[Ljava/lang/String;

.field public static final STATUS_E2E:I = 0x0

.field public static final STATUS_LOCAL:I = 0x1

.field public static final STATUS_REMOTE:I = 0x2

.field public static final STRENGTH:[Ljava/lang/String;

.field public static final STRENGTH_FAILURE:I = 0x1

.field public static final STRENGTH_MANDATORY:I = 0x4

.field public static final STRENGTH_NONE:I = 0x2

.field public static final STRENGTH_OPTIONAL:I = 0x3

.field public static final STRENGTH_UNKNOWN:I


# instance fields
.field protected preconditionAttributes:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 638
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "unknown"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string/jumbo v1, "failure"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string/jumbo v4, "none"

    aput-object v4, v0, v1

    const-string/jumbo v5, "optional"

    const/4 v6, 0x3

    aput-object v5, v0, v6

    const-string/jumbo v5, "mandatory"

    const/4 v7, 0x4

    aput-object v5, v0, v7

    sput-object v0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->STRENGTH:[Ljava/lang/String;

    .line 649
    new-array v0, v7, [Ljava/lang/String;

    aput-object v4, v0, v2

    const-string/jumbo v4, "send"

    aput-object v4, v0, v3

    const-string/jumbo v4, "recv"

    aput-object v4, v0, v1

    const-string/jumbo v4, "sendrecv"

    aput-object v4, v0, v6

    sput-object v0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->DIRECTION:[Ljava/lang/String;

    .line 659
    new-array v0, v6, [Ljava/lang/String;

    const-string/jumbo v4, "e2e"

    aput-object v4, v0, v2

    const-string/jumbo v4, "local"

    aput-object v4, v0, v3

    const-string/jumbo v4, "remote"

    aput-object v4, v0, v1

    sput-object v0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->STATUS:[Ljava/lang/String;

    .line 666
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "qos"

    aput-object v1, v0, v2

    sput-object v0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->PRECONDITION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    .line 69
    return-void
.end method


# virtual methods
.method public getPreconditionConfirmStatus()Ljava/util/Vector;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 604
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 605
    return-object v1

    .line 608
    :cond_0
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 609
    .local v0, "vCurr":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 611
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 615
    .local v3, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "conf"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 616
    goto :goto_1

    .line 619
    :cond_1
    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 609
    .end local v3    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 623
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v2

    if-nez v2, :cond_3

    .line 624
    return-object v1

    .line 626
    :cond_3
    return-object v0
.end method

.method public getPreconditionCurr(Ljava/lang/String;)Ljava/util/Vector;
    .locals 6
    .param p1, "status"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;,
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 503
    if-eqz p1, :cond_5

    .line 506
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 507
    return-object v1

    .line 510
    :cond_0
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 511
    .local v0, "vCurr":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 513
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 517
    .local v3, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "curr"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 518
    goto :goto_1

    .line 523
    :cond_1
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    .line 524
    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 511
    .end local v3    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 528
    .end local v2    # "i":I
    :cond_3
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 529
    return-object v1

    .line 531
    :cond_4
    return-object v0

    .line 504
    .end local v0    # "vCurr":Ljava/util/Vector;
    :cond_5
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The status-type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPreconditionDes(Ljava/lang/String;)Ljava/util/Vector;
    .locals 6
    .param p1, "status"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;,
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 553
    if-eqz p1, :cond_5

    .line 556
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 557
    return-object v1

    .line 560
    :cond_0
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 561
    .local v0, "vCurr":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 563
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 567
    .local v3, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v4

    invoke-virtual {v4}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "des"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 568
    goto :goto_1

    .line 573
    :cond_1
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    .line 574
    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 561
    .end local v3    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 578
    .end local v2    # "i":I
    :cond_3
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 579
    return-object v1

    .line 581
    :cond_4
    return-object v0

    .line 554
    .end local v0    # "vCurr":Ljava/util/Vector;
    :cond_5
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The status-type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPreconditionSize()I
    .locals 1

    .line 79
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0

    .line 83
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public getPreconditions()Ljava/util/Vector;
    .locals 1

    .line 93
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    return-object v0
.end method

.method public setPreconditionConfirmStatus(Ljava/lang/String;)V
    .locals 3
    .param p1, "precondConfValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 376
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 378
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    if-eqz v0, :cond_0

    .line 389
    :try_start_0
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 391
    .local v0, "attributes":[Ljava/lang/String;
    const/4 v1, 0x1

    aget-object v1, v0, v1

    const/4 v2, 0x2

    aget-object v2, v0, v2

    invoke-virtual {p0, v1, v2}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->setPreconditionConfirmStatus(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 400
    .end local v0    # "attributes":[Ljava/lang/String;
    nop

    .line 402
    return-void

    .line 396
    :catch_0
    move-exception v0

    .line 398
    .local v0, "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Landroid/javax/sdp/SdpException;

    const-string v2, "Error spliting the \"conf\" attribute into words"

    invoke-direct {v1, v2, v0}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 379
    .end local v0    # "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The Precondition Attributes is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 377
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The Precondition \"conf\" attribute value is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreconditionConfirmStatus(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "direction"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 424
    if-eqz p1, :cond_6

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_6

    .line 426
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_5

    .line 429
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    if-eqz v0, :cond_4

    .line 432
    const/4 v0, 0x0

    .line 434
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    const-string v2, " "

    const-string/jumbo v3, "qos "

    const-string/jumbo v4, "conf"

    if-ge v0, v1, :cond_2

    .line 436
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 444
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 445
    goto :goto_1

    .line 450
    :cond_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 452
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v6, :cond_2

    .line 455
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setValue(Ljava/lang/String;)V

    .line 456
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v5, v1, v0}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    goto :goto_2

    .line 434
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 464
    :cond_2
    :goto_2
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 468
    new-instance v1, Landroid/gov/nist/core/NameValue;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 471
    .local v1, "nv":Landroid/gov/nist/core/NameValue;
    new-instance v2, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    invoke-direct {v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;-><init>()V

    .line 472
    .local v2, "newAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 473
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 478
    .end local v1    # "nv":Landroid/gov/nist/core/NameValue;
    .end local v2    # "newAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_3
    return-void

    .line 430
    .end local v0    # "i":I
    :cond_4
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "Precondition Attributes is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 427
    :cond_5
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The direction-tag is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 425
    :cond_6
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The status-type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreconditionCurr(Ljava/lang/String;)V
    .locals 3
    .param p1, "precondCurrValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 122
    if-eqz p1, :cond_1

    .line 124
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    if-eqz v0, :cond_0

    .line 139
    :try_start_0
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "attributes":[Ljava/lang/String;
    const/4 v1, 0x1

    aget-object v1, v0, v1

    const/4 v2, 0x2

    aget-object v2, v0, v2

    invoke-virtual {p0, v1, v2}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->setPreconditionCurr(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .end local v0    # "attributes":[Ljava/lang/String;
    nop

    .line 160
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 156
    .local v0, "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Landroid/javax/sdp/SdpException;

    const-string v2, "Error spliting the \"curr\" attribute into words"

    invoke-direct {v1, v2, v0}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 125
    .end local v0    # "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The Precondition Attributes is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The Precondition \"curr\" attribute value is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreconditionCurr(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "directionTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 181
    if-eqz p1, :cond_6

    .line 183
    if-eqz p2, :cond_5

    .line 186
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    if-eqz v0, :cond_4

    .line 189
    const/4 v0, 0x0

    .line 191
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    const-string v2, " "

    const-string/jumbo v3, "qos "

    const-string/jumbo v4, "curr"

    if-ge v0, v1, :cond_2

    .line 193
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 197
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 198
    goto :goto_1

    .line 203
    :cond_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 205
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v6, :cond_2

    .line 208
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setValue(Ljava/lang/String;)V

    .line 209
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v2, v1, v0}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 191
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 218
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 221
    new-instance v1, Landroid/gov/nist/core/NameValue;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 223
    .local v1, "nv":Landroid/gov/nist/core/NameValue;
    new-instance v2, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    invoke-direct {v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;-><init>()V

    .line 224
    .local v2, "newAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 225
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 227
    .end local v1    # "nv":Landroid/gov/nist/core/NameValue;
    .end local v2    # "newAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_3
    return-void

    .line 187
    .end local v0    # "i":I
    :cond_4
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "Precondition Attributes is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :cond_5
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The direction-tag is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_6
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The status-type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreconditionDes(Ljava/lang/String;)V
    .locals 4
    .param p1, "precondDesValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 244
    if-eqz p1, :cond_1

    .line 246
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    if-eqz v0, :cond_0

    .line 262
    :try_start_0
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 272
    .local v0, "attributes":[Ljava/lang/String;
    const/4 v1, 0x1

    aget-object v1, v0, v1

    const/4 v2, 0x2

    aget-object v2, v0, v2

    const/4 v3, 0x3

    aget-object v3, v0, v3

    invoke-virtual {p0, v1, v2, v3}, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->setPreconditionDes(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    .end local v0    # "attributes":[Ljava/lang/String;
    nop

    .line 283
    return-void

    .line 277
    :catch_0
    move-exception v0

    .line 279
    .local v0, "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Landroid/javax/sdp/SdpException;

    const-string v2, "Error spliting the \"des\" attribute into words"

    invoke-direct {v1, v2, v0}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 247
    .end local v0    # "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The Precondition Attributes is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 245
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The Precondition \"des\" attribute value is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreconditionDes(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "strength"    # Ljava/lang/String;
    .param p2, "status"    # Ljava/lang/String;
    .param p3, "direction"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 313
    if-eqz p1, :cond_7

    .line 315
    if-eqz p2, :cond_6

    .line 317
    if-eqz p3, :cond_5

    .line 320
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    if-eqz v0, :cond_4

    .line 323
    const/4 v0, 0x0

    .line 325
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    const-string/jumbo v2, "qos "

    const-string/jumbo v3, "des"

    const-string v4, " "

    if-ge v0, v1, :cond_2

    .line 327
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 331
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getAttribute()Landroid/gov/nist/core/NameValue;

    move-result-object v5

    invoke-virtual {v5}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 332
    goto :goto_1

    .line 336
    :cond_0
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v5, -0x1

    if-eq v3, v5, :cond_1

    .line 340
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setValue(Ljava/lang/String;)V

    .line 341
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v2, v1, v0}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 325
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 347
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 351
    new-instance v1, Landroid/gov/nist/core/NameValue;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 354
    .local v1, "nv":Landroid/gov/nist/core/NameValue;
    new-instance v2, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    invoke-direct {v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;-><init>()V

    .line 355
    .local v2, "newAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setAttribute(Landroid/gov/nist/core/NameValue;)V

    .line 356
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 358
    .end local v1    # "nv":Landroid/gov/nist/core/NameValue;
    .end local v2    # "newAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_3
    return-void

    .line 321
    .end local v0    # "i":I
    :cond_4
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "Precondition Attributes is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_5
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The direction-tag is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 316
    :cond_6
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The status-type is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_7
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The strength-tag is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreconditions(Ljava/util/Vector;)V
    .locals 2
    .param p1, "preconditions"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 105
    if-eqz p1, :cond_0

    .line 108
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/PreconditionFields;->preconditionAttributes:Ljava/util/Vector;

    .line 109
    return-void

    .line 106
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "Precondition attributes are null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
