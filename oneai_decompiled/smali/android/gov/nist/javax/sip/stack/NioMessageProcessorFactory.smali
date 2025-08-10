.class public Landroid/gov/nist/javax/sip/stack/NioMessageProcessorFactory;
.super Ljava/lang/Object;
.source "NioMessageProcessorFactory.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createMessageProcessor(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Ljava/net/InetAddress;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 4
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "ipAddress"    # Ljava/net/InetAddress;
    .param p3, "port"    # I
    .param p4, "transport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    const-string v0, "Error initializing SCTP"

    const-string/jumbo v1, "UDP"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 43
    new-instance v0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    invoke-direct {v0, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 45
    .local v0, "udpMessageProcessor":Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
    const/4 v1, 0x1

    iput-boolean v1, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->udpFlag:Z

    .line 46
    return-object v0

    .line 47
    .end local v0    # "udpMessageProcessor":Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
    :cond_0
    const-string/jumbo v1, "TCP"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 48
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;

    invoke-direct {v0, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 51
    .local v0, "nioTcpMessageProcessor":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    return-object v0

    .line 52
    .end local v0    # "nioTcpMessageProcessor":Landroid/gov/nist/javax/sip/stack/NioTcpMessageProcessor;
    :cond_1
    const-string/jumbo v1, "TLS"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 53
    new-instance v0, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;

    invoke-direct {v0, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 56
    .local v0, "tlsMessageProcessor":Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;
    return-object v0

    .line 57
    .end local v0    # "tlsMessageProcessor":Landroid/gov/nist/javax/sip/stack/NioTlsMessageProcessor;
    :cond_2
    const-string/jumbo v1, "SCTP"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 63
    :try_start_0
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "android.gov.nist.javax.sip.stack.sctp.SCTPMessageProcessor"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 65
    .local v1, "mpc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 66
    .local v2, "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {v2, p2, p3, p1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->initialize(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    return-object v2

    .line 74
    .end local v1    # "mpc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :catch_0
    move-exception v1

    .line 75
    .local v1, "ie":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 71
    .end local v1    # "ie":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v1

    .line 72
    .local v1, "ie":Ljava/lang/InstantiationException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 68
    .end local v1    # "ie":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "SCTP not supported (needs Java 7 and SCTP jar in classpath)"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_3
    const-string/jumbo v0, "WS"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const-string/jumbo v2, "android.gov.nist.javax.sip.USE_TLS_GATEWAY"

    const-string/jumbo v3, "true"

    if-eqz v1, :cond_5

    .line 79
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 80
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;

    invoke-direct {v1, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 82
    .local v1, "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    .line 83
    return-object v1

    .line 85
    .end local v1    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_4
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;

    invoke-direct {v1, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 87
    .restart local v1    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    .line 88
    return-object v1

    .line 91
    .end local v1    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_5
    const-string/jumbo v0, "WSS"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 93
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->getConfigurationProperties()Ljava/util/Properties;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 94
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;

    invoke-direct {v1, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/NioWebSocketMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 96
    .restart local v1    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    .line 97
    return-object v1

    .line 99
    .end local v1    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_6
    new-instance v1, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;

    invoke-direct {v1, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 101
    .restart local v1    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    iput-object v0, v1, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->transport:Ljava/lang/String;

    .line 102
    return-object v1

    .line 105
    .end local v1    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "bad transport"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
