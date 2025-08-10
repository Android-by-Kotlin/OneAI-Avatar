.class public Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
.super Ljava/lang/Object;
.source "TimeDescriptionImpl.java"

# interfaces
.implements Landroid/javax/sdp/TimeDescription;


# instance fields
.field private repeatList:Ljava/util/Vector;

.field private timeImpl:Landroid/gov/nist/javax/sdp/fields/TimeField;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TimeField;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->timeImpl:Landroid/gov/nist/javax/sdp/fields/TimeField;

    .line 52
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->repeatList:Ljava/util/Vector;

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sdp/fields/TimeField;)V
    .locals 1
    .param p1, "timeField"    # Landroid/gov/nist/javax/sdp/fields/TimeField;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->timeImpl:Landroid/gov/nist/javax/sdp/fields/TimeField;

    .line 64
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->repeatList:Ljava/util/Vector;

    .line 65
    return-void
.end method


# virtual methods
.method public addRepeatField(Landroid/gov/nist/javax/sdp/fields/RepeatField;)V
    .locals 2
    .param p1, "repeatField"    # Landroid/gov/nist/javax/sdp/fields/RepeatField;

    .line 128
    if-eqz p1, :cond_0

    .line 130
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->repeatList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 131
    return-void

    .line 129
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null repeatField"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRepeatTimes(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z

    .line 105
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->repeatList:Ljava/util/Vector;

    return-object v0
.end method

.method public getTime()Landroid/javax/sdp/Time;
    .locals 1

    .line 73
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->timeImpl:Landroid/gov/nist/javax/sdp/fields/TimeField;

    return-object v0
.end method

.method public setRepeatTimes(Ljava/util/Vector;)V
    .locals 0
    .param p1, "repeatTimes"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 118
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->repeatList:Ljava/util/Vector;

    .line 119
    return-void
.end method

.method public setTime(Landroid/javax/sdp/Time;)V
    .locals 2
    .param p1, "timeField"    # Landroid/javax/sdp/Time;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 85
    if-eqz p1, :cond_1

    .line 88
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/TimeField;

    if-eqz v0, :cond_0

    .line 89
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/TimeField;

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->timeImpl:Landroid/gov/nist/javax/sdp/fields/TimeField;

    .line 94
    return-void

    .line 91
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is not an instance of TimeField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 134
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->timeImpl:Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sdp/fields/TimeField;->encode()Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "retval":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->repeatList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 136
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->repeatList:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    .line 138
    .local v2, "repeatField":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->encode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    .end local v2    # "repeatField":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 140
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method
