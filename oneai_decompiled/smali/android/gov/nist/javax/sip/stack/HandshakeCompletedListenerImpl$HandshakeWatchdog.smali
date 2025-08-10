.class Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;
.super Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;
.source "HandshakeCompletedListenerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HandshakeWatchdog"
.end annotation


# instance fields
.field socket:Ljava/net/Socket;

.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;


# direct methods
.method private constructor <init>(Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;Ljava/net/Socket;)V
    .locals 0
    .param p2, "socket"    # Ljava/net/Socket;

    .line 149
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;->this$0:Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;-><init>()V

    .line 150
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;->socket:Ljava/net/Socket;

    .line 151
    return-void
.end method

.method synthetic constructor <init>(Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;Ljava/net/Socket;Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;
    .param p2, "x1"    # Ljava/net/Socket;
    .param p3, "x2"    # Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$1;

    .line 146
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;-><init>(Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;Ljava/net/Socket;)V

    return-void
.end method


# virtual methods
.method public getThreadHash()Ljava/lang/Object;
    .locals 1

    .line 155
    const/4 v0, 0x0

    return-object v0
.end method

.method public runTask()V
    .locals 4

    .line 160
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "closing socket "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;->socket:Ljava/net/Socket;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " on sslhandshaketimeout"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 162
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    goto :goto_0

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v1

    const-string/jumbo v3, "couldn\'t close socket on sslhandshaketimeout"

    invoke-interface {v1, v3}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 166
    .end local v0    # "ex":Ljava/io/IOException;
    :goto_0
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "socket closed "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/HandshakeCompletedListenerImpl$HandshakeWatchdog;->socket:Ljava/net/Socket;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 167
    return-void
.end method
