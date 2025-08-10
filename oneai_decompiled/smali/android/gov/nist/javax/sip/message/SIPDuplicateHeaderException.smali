.class public Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;
.super Ljava/text/ParseException;
.source "SIPDuplicateHeaderException.java"


# static fields
.field private static final serialVersionUID:J = 0x725e4b654221d27bL


# instance fields
.field protected sipHeader:Landroid/gov/nist/javax/sip/header/SIPHeader;

.field protected sipMessage:Landroid/gov/nist/javax/sip/message/SIPMessage;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .line 52
    return-void
.end method


# virtual methods
.method public getSIPHeader()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 1

    .line 58
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;->sipHeader:Landroid/gov/nist/javax/sip/header/SIPHeader;

    return-object v0
.end method

.method public getSIPMessage()Landroid/gov/nist/javax/sip/message/SIPMessage;
    .locals 1

    .line 54
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;->sipMessage:Landroid/gov/nist/javax/sip/message/SIPMessage;

    return-object v0
.end method

.method public setSIPHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;)V
    .locals 0
    .param p1, "sipHeader"    # Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 62
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;->sipHeader:Landroid/gov/nist/javax/sip/header/SIPHeader;

    .line 63
    return-void
.end method

.method public setSIPMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;)V
    .locals 0
    .param p1, "sipMessage"    # Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 66
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPDuplicateHeaderException;->sipMessage:Landroid/gov/nist/javax/sip/message/SIPMessage;

    .line 67
    return-void
.end method
