.class public Landroid/gov/nist/javax/sdp/fields/TypedTime;
.super Landroid/gov/nist/javax/sdp/fields/SDPObject;
.source "TypedTime.java"


# instance fields
.field time:I

.field unit:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 3

    .line 42
    const-string v0, ""

    .line 43
    .local v0, "retval":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/gov/nist/javax/sdp/fields/TypedTime;->time:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/TypedTime;->unit:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/TypedTime;->unit:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 46
    :cond_0
    return-object v0
.end method

.method public getTime()I
    .locals 1

    .line 54
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/TypedTime;->time:I

    return v0
.end method

.method public getUnit()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/TypedTime;->unit:Ljava/lang/String;

    return-object v0
.end method

.method public setTime(I)V
    .locals 0
    .param p1, "t"    # I

    .line 50
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/TypedTime;->time:I

    .line 51
    return-void
.end method

.method public setUnit(Ljava/lang/String;)V
    .locals 0
    .param p1, "u"    # Ljava/lang/String;

    .line 62
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/TypedTime;->unit:Ljava/lang/String;

    .line 63
    return-void
.end method
