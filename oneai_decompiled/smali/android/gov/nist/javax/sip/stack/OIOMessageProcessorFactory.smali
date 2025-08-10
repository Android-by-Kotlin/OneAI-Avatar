.class public Landroid/gov/nist/javax/sip/stack/OIOMessageProcessorFactory;
.super Ljava/lang/Object;
.source "OIOMessageProcessorFactory.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createMessageProcessor(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Ljava/net/InetAddress;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    .locals 3
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "ipAddress"    # Ljava/net/InetAddress;
    .param p3, "port"    # I
    .param p4, "transport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    const-string v0, "Error initializing SCTP"

    const-string/jumbo v1, "UDP"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    new-instance v0, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;

    invoke-direct {v0, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 48
    .local v0, "udpMessageProcessor":Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
    const/4 v1, 0x1

    iput-boolean v1, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->udpFlag:Z

    .line 49
    return-object v0

    .line 50
    .end local v0    # "udpMessageProcessor":Landroid/gov/nist/javax/sip/stack/UDPMessageProcessor;
    :cond_0
    const-string/jumbo v1, "TCP"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 51
    new-instance v0, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;

    invoke-direct {v0, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 54
    .local v0, "tcpMessageProcessor":Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
    return-object v0

    .line 55
    .end local v0    # "tcpMessageProcessor":Landroid/gov/nist/javax/sip/stack/TCPMessageProcessor;
    :cond_1
    const-string/jumbo v1, "TLS"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 56
    new-instance v0, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;

    invoke-direct {v0, p2, p1, p3}, Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;-><init>(Ljava/net/InetAddress;Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;I)V

    .line 59
    .local v0, "tlsMessageProcessor":Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
    return-object v0

    .line 60
    .end local v0    # "tlsMessageProcessor":Landroid/gov/nist/javax/sip/stack/TLSMessageProcessor;
    :cond_2
    const-string/jumbo v1, "SCTP"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 66
    :try_start_0
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "android.gov.nist.javax.sip.stack.sctp.SCTPMessageProcessor"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 68
    .local v1, "mpc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 69
    .local v2, "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    invoke-virtual {v2, p2, p3, p1}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->initialize(Ljava/net/InetAddress;ILandroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    return-object v2

    .line 77
    .end local v1    # "mpc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "mp":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :catch_0
    move-exception v1

    .line 78
    .local v1, "ie":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 74
    .end local v1    # "ie":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v1

    .line 75
    .local v1, "ie":Ljava/lang/InstantiationException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 71
    .end local v1    # "ie":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "SCTP not supported (needs Java 7 and SCTP jar in classpath)"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 82
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "bad transport"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
