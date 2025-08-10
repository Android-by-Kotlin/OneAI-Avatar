.class public Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
.super Ljava/lang/Object;
.source "HandshakeCompletedListenerImpl.java"

# interfaces
.implements Ljavax/net/ssl/HandshakeCompletedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;
    }
.end annotation


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private cipherSuite:Ljava/lang/String;

.field private final eventWaitObject:Ljava/lang/Object;

.field private handshakeCompletedEvent:Ljavax/net/ssl/HandshakeCompletedEvent;

.field private localCertificates:[Ljava/security/cert/Certificate;

.field private peerCertificates:[Ljava/security/cert/Certificate;

.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field private watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    const-class v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;Ljava/nio/channels/SocketChannel;)V
    .locals 4
    .param p1, "tlsMessageChannel"    # Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;
    .param p2, "socket"    # Ljava/nio/channels/SocketChannel;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->eventWaitObject:Ljava/lang/Object;

    .line 55
    invoke-virtual {p1, p0}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 56
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 57
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSslHandshakeTimeout()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 58
    new-instance v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    invoke-virtual {p2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;-><init>(Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;Ljava/net/Socket;Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$1;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    .line 60
    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;Ljava/net/Socket;)V
    .locals 4
    .param p1, "tlsMessageChannel"    # Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;
    .param p2, "socket"    # Ljava/net/Socket;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->eventWaitObject:Ljava/lang/Object;

    .line 47
    invoke-virtual {p1, p0}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->setHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 48
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/TLSMessageChannel;->getSIPStack()Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 49
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSslHandshakeTimeout()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 50
    new-instance v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;-><init>(Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;Ljava/net/Socket;Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$1;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    .line 52
    :cond_0
    return-void
.end method

.method static synthetic access$100()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 32
    sget-object v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method


# virtual methods
.method public getCipherSuite()Ljava/lang/String;
    .locals 1

    .line 120
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->cipherSuite:Ljava/lang/String;

    return-object v0
.end method

.method public getHandshakeCompletedEvent()Ljavax/net/ssl/HandshakeCompletedEvent;
    .locals 4

    .line 82
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->eventWaitObject:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :try_start_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->handshakeCompletedEvent:Ljavax/net/ssl/HandshakeCompletedEvent;

    if-nez v1, :cond_0

    .line 84
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->eventWaitObject:Ljava/lang/Object;

    const-wide/16 v2, 0x1388

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 85
    :cond_0
    monitor-exit v0

    .line 89
    goto :goto_0

    .line 85
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 87
    :catch_0
    move-exception v0

    .line 90
    :goto_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->handshakeCompletedEvent:Ljavax/net/ssl/HandshakeCompletedEvent;

    return-object v0
.end method

.method public getLocalCertificates()[Ljava/security/cert/Certificate;
    .locals 1

    .line 135
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->localCertificates:[Ljava/security/cert/Certificate;

    return-object v0
.end method

.method public getPeerCertificates()[Ljava/security/cert/Certificate;
    .locals 1

    .line 105
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->peerCertificates:[Ljava/security/cert/Certificate;

    return-object v0
.end method

.method public handshakeCompleted(Ljavax/net/ssl/HandshakeCompletedEvent;)V
    .locals 2
    .param p1, "handshakeCompletedEvent"    # Ljavax/net/ssl/HandshakeCompletedEvent;

    .line 63
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    invoke-interface {v0, v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->cancel(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;)Z

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    .line 67
    :cond_0
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->handshakeCompletedEvent:Ljavax/net/ssl/HandshakeCompletedEvent;

    .line 68
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->eventWaitObject:Ljava/lang/Object;

    monitor-enter v0

    .line 69
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->eventWaitObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 70
    monitor-exit v0

    .line 71
    return-void

    .line 70
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setCipherSuite(Ljava/lang/String;)V
    .locals 0
    .param p1, "cipherSuite"    # Ljava/lang/String;

    .line 127
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->cipherSuite:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setLocalCertificates([Ljava/security/cert/Certificate;)V
    .locals 0
    .param p1, "localCertificates"    # [Ljava/security/cert/Certificate;

    .line 142
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->localCertificates:[Ljava/security/cert/Certificate;

    .line 143
    return-void
.end method

.method public setPeerCertificates([Ljava/security/cert/Certificate;)V
    .locals 0
    .param p1, "peerCertificates"    # [Ljava/security/cert/Certificate;

    .line 112
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->peerCertificates:[Ljava/security/cert/Certificate;

    .line 113
    return-void
.end method

.method public startHandshakeWatchdog()V
    .locals 4

    .line 94
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    if-eqz v0, :cond_0

    .line 95
    sget-object v0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "starting watchdog for socket "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    iget-object v2, v2, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;->socket:Ljava/net/Socket;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " on sslhandshake "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSslHandshakeTimeout()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->watchdog:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getSslHandshakeTimeout()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z

    .line 98
    :cond_0
    return-void
.end method
