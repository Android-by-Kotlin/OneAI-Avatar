.class final Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;
.super Ljava/lang/Object;
.source "SIPDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/SIPDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ACKWrapper"
.end annotation


# instance fields
.field cSeq:Landroid/javax/sip/header/CSeqHeader;

.field dialogId:Ljava/lang/String;

.field fromTag:Ljava/lang/String;

.field msgBytes:Ljava/lang/String;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPDialog;Landroid/gov/nist/javax/sip/message/SIPRequest;)V
    .locals 0
    .param p2, "req"    # Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 1654
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1655
    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setTransaction(Ljava/lang/Object;)V

    .line 1656
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->encode()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->msgBytes:Ljava/lang/String;

    .line 1657
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getFromTag()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->fromTag:Ljava/lang/String;

    .line 1658
    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getDialogId(Z)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->dialogId:Ljava/lang/String;

    .line 1659
    invoke-virtual {p2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object p1

    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->cSeq:Landroid/javax/sip/header/CSeqHeader;

    .line 1660
    return-void
.end method


# virtual methods
.method public getCSeq()Landroid/javax/sip/header/CSeqHeader;
    .locals 1

    .line 1667
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->cSeq:Landroid/javax/sip/header/CSeqHeader;

    return-object v0
.end method

.method public getDialogId()Ljava/lang/String;
    .locals 1

    .line 1670
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->dialogId:Ljava/lang/String;

    return-object v0
.end method

.method public getFromTag()Ljava/lang/String;
    .locals 1

    .line 1663
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->fromTag:Ljava/lang/String;

    return-object v0
.end method

.method public reparseRequest()Landroid/gov/nist/javax/sip/message/SIPRequest;
    .locals 5

    .line 1674
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v1}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMessageParserFactory()Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->this$0:Landroid/gov/nist/javax/sip/stack/SIPDialog;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$000(Landroid/gov/nist/javax/sip/stack/SIPDialog;)Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;->createMessageParser(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)Landroid/gov/nist/javax/sip/parser/MessageParser;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/SIPDialog$ACKWrapper;->msgBytes:Ljava/lang/String;

    const-string/jumbo v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, v4, v0}, Landroid/gov/nist/javax/sip/parser/MessageParser;->parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPRequest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1675
    :catch_0
    move-exception v1

    .line 1676
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1677
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/SIPDialog;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v2

    const-string/jumbo v3, "SIPDialog::resendAck:lastAck failed reparsing, hence not resending ACK"

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1679
    :cond_0
    return-object v0
.end method
