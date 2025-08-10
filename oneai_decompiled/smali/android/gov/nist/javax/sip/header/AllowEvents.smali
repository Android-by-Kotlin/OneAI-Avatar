.class public final Landroid/gov/nist/javax/sip/header/AllowEvents;
.super Landroid/gov/nist/javax/sip/header/SIPHeader;
.source "AllowEvents.java"

# interfaces
.implements Landroid/javax/sip/header/AllowEventsHeader;


# static fields
.field private static final serialVersionUID:J = 0x893718ec0c30d9aL


# instance fields
.field protected eventType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    const-string v0, "Allow-Events"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "m"    # Ljava/lang/String;

    .line 65
    const-string v0, "Allow-Events"

    invoke-direct {p0, v0}, Landroid/gov/nist/javax/sip/header/SIPHeader;-><init>(Ljava/lang/String;)V

    .line 66
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/AllowEvents;->eventType:Ljava/lang/String;

    .line 67
    return-void
.end method


# virtual methods
.method protected encodeBody(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 99
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AllowEvents;->eventType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getEventType()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Landroid/gov/nist/javax/sip/header/AllowEvents;->eventType:Ljava/lang/String;

    return-object v0
.end method

.method public setEventType(Ljava/lang/String;)V
    .locals 2
    .param p1, "eventType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 78
    if-eqz p1, :cond_0

    .line 82
    iput-object p1, p0, Landroid/gov/nist/javax/sip/header/AllowEvents;->eventType:Ljava/lang/String;

    .line 83
    return-void

    .line 79
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "JAIN-SIP Exception,AllowEvents, setEventType(), the eventType parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
