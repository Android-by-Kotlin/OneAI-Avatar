.class public Landroid/gov/nist/javax/sdp/fields/TimeField;
.super Landroid/gov/nist/javax/sdp/fields/SDPField;
.source "TimeField.java"

# interfaces
.implements Landroid/javax/sdp/Time;


# instance fields
.field protected startTime:J

.field protected stopTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 47
    const-string/jumbo v0, "t="

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sdp/fields/SDPField;-><init>(Ljava/lang/String;)V

    .line 48
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 3

    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "t="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->startTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->stopTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStart()Ljava/util/Date;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 73
    iget-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->startTime:J

    invoke-static {v0, v1}, Landroid/javax/sdp/SdpFactory;->getDateFromNtp(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getStartTime()J
    .locals 2

    .line 50
    iget-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->startTime:J

    return-wide v0
.end method

.method public getStop()Ljava/util/Date;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 81
    iget-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->stopTime:J

    invoke-static {v0, v1}, Landroid/javax/sdp/SdpFactory;->getDateFromNtp(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getStopTime()J
    .locals 2

    .line 53
    iget-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->stopTime:J

    return-wide v0
.end method

.method public getTypedTime()Z
    .locals 1

    .line 124
    const/4 v0, 0x0

    return v0
.end method

.method public isZero()Z
    .locals 4

    .line 150
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/TimeField;->getStartTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/TimeField;->getStopTime()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setStart(Ljava/util/Date;)V
    .locals 2
    .param p1, "start"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 101
    if-eqz p1, :cond_0

    .line 104
    invoke-static {p1}, Landroid/javax/sdp/SdpFactory;->getNtpTime(Ljava/util/Date;)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->startTime:J

    .line 106
    return-void

    .line 102
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The date is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setStartTime(J)V
    .locals 0
    .param p1, "startTime"    # J

    .line 59
    iput-wide p1, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->startTime:J

    .line 60
    return-void
.end method

.method public setStop(Ljava/util/Date;)V
    .locals 2
    .param p1, "stop"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 89
    if-eqz p1, :cond_0

    .line 92
    invoke-static {p1}, Landroid/javax/sdp/SdpFactory;->getNtpTime(Ljava/util/Date;)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->stopTime:J

    .line 94
    return-void

    .line 90
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The date is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setStopTime(J)V
    .locals 0
    .param p1, "stopTime"    # J

    .line 65
    iput-wide p1, p0, Landroid/gov/nist/javax/sdp/fields/TimeField;->stopTime:J

    .line 66
    return-void
.end method

.method public setTypedTime(Z)V
    .locals 0
    .param p1, "typedTime"    # Z

    .line 144
    return-void
.end method

.method public setZero()V
    .locals 2

    .line 156
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStopTime(J)V

    .line 157
    invoke-virtual {p0, v0, v1}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStartTime(J)V

    .line 158
    return-void
.end method
