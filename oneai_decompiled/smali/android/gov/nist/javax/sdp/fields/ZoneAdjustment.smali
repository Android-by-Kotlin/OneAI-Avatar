.class public Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
.super Landroid/gov/nist/javax/sdp/fields/SDPObject;
.source "ZoneAdjustment.java"


# instance fields
.field protected offset:Landroid/gov/nist/javax/sdp/fields/TypedTime;

.field protected sign:Ljava/lang/String;

.field protected time:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 99
    invoke-super {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;

    .line 100
    .local v0, "retval":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->offset:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    if-eqz v1, :cond_0

    .line 101
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->offset:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    iput-object v1, v0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->offset:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 102
    :cond_0
    return-object v0
.end method

.method public encode()Ljava/lang/String;
    .locals 3

    .line 90
    iget-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->time:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "retval":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 92
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->sign:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->sign:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 94
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->offset:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    return-object v0
.end method

.method public getOffset()Landroid/gov/nist/javax/sdp/fields/TypedTime;
    .locals 1

    .line 66
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->offset:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    return-object v0
.end method

.method public getTime()J
    .locals 2

    .line 59
    iget-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->time:J

    return-wide v0
.end method

.method public setOffset(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V
    .locals 0
    .param p1, "off"    # Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 74
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->offset:Landroid/gov/nist/javax/sdp/fields/TypedTime;

    .line 75
    return-void
.end method

.method public setSign(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .line 82
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->sign:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setTime(J)V
    .locals 0
    .param p1, "t"    # J

    .line 52
    iput-wide p1, p0, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->time:J

    .line 53
    return-void
.end method
