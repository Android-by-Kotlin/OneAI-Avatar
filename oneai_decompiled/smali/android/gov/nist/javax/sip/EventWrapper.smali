.class public Landroid/gov/nist/javax/sip/EventWrapper;
.super Ljava/lang/Object;
.source "EventWrapper.java"


# instance fields
.field protected sipEvent:Ljava/util/EventObject;

.field protected transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;


# direct methods
.method public constructor <init>(Ljava/util/EventObject;Landroid/gov/nist/javax/sip/stack/SIPTransaction;)V
    .locals 0
    .param p1, "sipEvent"    # Ljava/util/EventObject;
    .param p2, "transaction"    # Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Landroid/gov/nist/javax/sip/EventWrapper;->sipEvent:Ljava/util/EventObject;

    .line 41
    iput-object p2, p0, Landroid/gov/nist/javax/sip/EventWrapper;->transaction:Landroid/gov/nist/javax/sip/stack/SIPTransaction;

    .line 42
    return-void
.end method
