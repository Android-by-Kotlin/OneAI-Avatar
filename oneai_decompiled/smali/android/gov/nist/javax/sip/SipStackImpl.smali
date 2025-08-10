.class public Landroid/gov/nist/javax/sip/SipStackImpl;
.super Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
.source "SipStackImpl.java"

# interfaces
.implements Landroid/javax/sip/SipStack;
.implements Landroid/gov/nist/javax/sip/SipStackExt;


# static fields
.field public static final DEFAULT_CIPHERS:[Ljava/lang/String;

.field public static final MAX_DATAGRAM_SIZE:Ljava/lang/Integer;

.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private cipherSuites:[Ljava/lang/String;

.field private configurationProperties:Ljava/util/Properties;

.field private enabledProtocols:[Ljava/lang/String;

.field private eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

.field protected listeningPoints:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Ljava/lang/String;",
            "Landroid/gov/nist/javax/sip/ListeningPointImpl;",
            ">;"
        }
    .end annotation
.end field

.field private reEntrantListener:Z

.field sipListener:Landroid/javax/sip/SipListener;

.field protected sipProviders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/gov/nist/javax/sip/SipProviderImpl;",
            ">;"
        }
    .end annotation
.end field

.field private stackSemaphore:Ljava/util/concurrent/Semaphore;

.field tlsSecurityPolicy:Landroid/gov/nist/javax/sip/TlsSecurityPolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 654
    const-class v0, Landroid/gov/nist/javax/sip/SipStackImpl;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    .line 664
    const/high16 v0, 0x10000

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->MAX_DATAGRAM_SIZE:Ljava/lang/Integer;

    .line 679
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "TLS_RSA_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "SSL_RSA_WITH_3DES_EDE_CBC_SHA"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "TLS_DH_anon_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "SSL_DH_anon_WITH_3DES_EDE_CBC_SHA"

    aput-object v2, v0, v1

    sput-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->DEFAULT_CIPHERS:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>()V
    .locals 5

    .line 705
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;-><init>()V

    .line 674
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->stackSemaphore:Ljava/util/concurrent/Semaphore;

    .line 689
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->DEFAULT_CIPHERS:[Ljava/lang/String;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->cipherSuites:[Ljava/lang/String;

    .line 692
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "TLSv1.2"

    aput-object v3, v0, v2

    const-string/jumbo v2, "TLSv1.1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "TLSv1"

    aput-object v2, v0, v1

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->enabledProtocols:[Ljava/lang/String;

    .line 706
    new-instance v0, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;)V

    .line 708
    .local v0, "msgFactory":Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setMessageFactory(Landroid/gov/nist/javax/sip/stack/StackMessageFactory;)V

    .line 709
    new-instance v1, Landroid/gov/nist/javax/sip/EventScanner;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/EventScanner;-><init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    .line 710
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->listeningPoints:Ljava/util/Hashtable;

    .line 711
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipProviders:Ljava/util/List;

    .line 713
    :try_start_0
    const-string/jumbo v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    .line 714
    .local v1, "charset":Ljava/nio/charset/Charset;
    if-eqz v1, :cond_0

    .line 719
    .end local v1    # "charset":Ljava/nio/charset/Charset;
    goto :goto_0

    .line 715
    .restart local v1    # "charset":Ljava/nio/charset/Charset;
    :cond_0
    new-instance v2, Ljava/nio/charset/UnsupportedCharsetException;

    const-string/jumbo v3, "Unsupported charset UTF-8"

    invoke-direct {v2, v3}, Ljava/nio/charset/UnsupportedCharsetException;-><init>(Ljava/lang/String;)V

    .end local v0    # "msgFactory":Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;
    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 717
    .end local v1    # "charset":Ljava/nio/charset/Charset;
    .restart local v0    # "msgFactory":Landroid/gov/nist/javax/sip/NistSipMessageFactoryImpl;
    :catch_0
    move-exception v1

    .line 718
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "UTF-8 charset cannot be used this system. This will lead to unpredictable behavior when parsing SIP messages: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 721
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public constructor <init>(Ljava/util/Properties;)V
    .locals 57
    .param p1, "configurationProperties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/PeerUnavailableException;
        }
    .end annotation

    .line 769
    move-object/from16 v9, p0

    const-string v10, "Cound not instantiate TLS security policy "

    const-string v1, "Cound not instantiate server logger "

    const-string v2, "Cound not instantiate stack logger "

    const-string v11, "- check that it is present on the classpath and that there is a no-args constructor defined"

    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/SipStackImpl;-><init>()V

    .line 770
    new-instance v0, Landroid/gov/nist/javax/sip/MergedSystemProperties;

    move-object/from16 v3, p1

    invoke-direct {v0, v3}, Landroid/gov/nist/javax/sip/MergedSystemProperties;-><init>(Ljava/util/Properties;)V

    move-object v12, v0

    .line 771
    .end local p1    # "configurationProperties":Ljava/util/Properties;
    .local v12, "configurationProperties":Ljava/util/Properties;
    iput-object v12, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->configurationProperties:Ljava/util/Properties;

    .line 772
    const-string/jumbo v0, "android.javax.sip.IP_ADDRESS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 776
    .local v13, "address":Ljava/lang/String;
    if-eqz v13, :cond_0

    .line 780
    :try_start_0
    invoke-super {v9, v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setHostAddress(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 783
    :catch_0
    move-exception v0

    move-object v1, v0

    move-object v0, v1

    .line 784
    .local v0, "ex":Ljava/net/UnknownHostException;
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "bad address "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 785
    .end local v0    # "ex":Ljava/net/UnknownHostException;
    :cond_0
    :goto_0
    nop

    .line 788
    const-string/jumbo v0, "android.javax.sip.STACK_NAME"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 790
    .local v14, "name":Ljava/lang/String;
    if-eqz v14, :cond_44

    .line 792
    invoke-super {v9, v14}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setStackName(Ljava/lang/String;)V

    .line 793
    const-string/jumbo v0, "android.gov.nist.javax.sip.STACK_LOGGER"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 796
    .local v0, "stackLoggerClassName":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 797
    const-string/jumbo v0, "android.gov.nist.core.LogWriter"

    move-object v15, v0

    goto :goto_1

    .line 796
    :cond_1
    move-object v15, v0

    .line 799
    .end local v0    # "stackLoggerClassName":Ljava/lang/String;
    .local v15, "stackLoggerClassName":Ljava/lang/String;
    :goto_1
    :try_start_1
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 800
    .local v0, "stackLoggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v8, 0x0

    new-array v3, v8, [Ljava/lang/Class;

    .line 801
    .local v3, "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 803
    .local v4, "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v5, v8, [Ljava/lang/Object;

    .line 804
    .local v5, "args":[Ljava/lang/Object;
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/core/StackLogger;

    .line 805
    .local v6, "stackLogger":Landroid/gov/nist/core/StackLogger;
    sput-object v6, Landroid/gov/nist/core/CommonLogger;->legacyLogger:Landroid/gov/nist/core/StackLogger;

    .line 806
    invoke-interface {v6, v12}, Landroid/gov/nist/core/StackLogger;->setStackProperties(Ljava/util/Properties;)V
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2e

    .line 819
    .end local v0    # "stackLoggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v4    # "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v5    # "args":[Ljava/lang/Object;
    .end local v6    # "stackLogger":Landroid/gov/nist/core/StackLogger;
    nop

    .line 821
    const-string/jumbo v0, "android.gov.nist.javax.sip.SERVER_LOGGER"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 824
    .local v0, "serverLoggerClassName":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 825
    const-string/jumbo v0, "android.gov.nist.javax.sip.stack.ServerLog"

    move-object/from16 v16, v0

    goto :goto_2

    .line 824
    :cond_2
    move-object/from16 v16, v0

    .line 827
    .end local v0    # "serverLoggerClassName":Ljava/lang/String;
    .local v16, "serverLoggerClassName":Ljava/lang/String;
    :goto_2
    :try_start_2
    invoke-static/range {v16 .. v16}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 829
    .local v0, "serverLoggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v2, v8, [Ljava/lang/Class;

    .line 830
    .local v2, "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 832
    .local v3, "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v4, v8, [Ljava/lang/Object;

    .line 833
    .local v4, "args":[Ljava/lang/Object;
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/ServerLogger;

    iput-object v5, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    .line 834
    iget-object v5, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    invoke-interface {v5, v9}, Landroid/gov/nist/core/ServerLogger;->setSipStack(Landroid/javax/sip/SipStack;)V

    .line 835
    iget-object v5, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->serverLogger:Landroid/gov/nist/core/ServerLogger;

    invoke-interface {v5, v12}, Landroid/gov/nist/core/ServerLogger;->setStackProperties(Ljava/util/Properties;)V
    :try_end_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2c

    .line 848
    .end local v0    # "serverLoggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "args":[Ljava/lang/Object;
    nop

    .line 850
    const-string/jumbo v0, "android.gov.nist.javax.sip.RELIABLE_CONNECTION_KEEP_ALIVE_TIMEOUT"

    const-string v7, "-1"

    invoke-virtual {v12, v0, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setReliableConnectionKeepAliveTimeout(I)V

    .line 854
    const-string/jumbo v0, "android.gov.nist.javax.sip.SSL_HANDSHAKE_TIMEOUT"

    invoke-virtual {v12, v0, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-super {v9, v0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setSslHandshakeTimeout(J)V

    .line 856
    const-string/jumbo v0, "android.gov.nist.javax.sip.THREAD_PRIORITY"

    const-string v1, "10"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setThreadPriority(I)V

    .line 861
    const-string/jumbo v0, "android.javax.sip.OUTBOUND_PROXY"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->outboundProxy:Ljava/lang/String;

    .line 865
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->getInstance()Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "android.gov.nist.javax.sip.stack.USE_DIRECT_BUFFERS"

    invoke-virtual {v12, v2, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/ByteBufferFactory;->setUseDirect(Z)V

    .line 869
    new-instance v0, Landroid/gov/nist/javax/sip/stack/DefaultRouter;

    iget-object v1, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->outboundProxy:Ljava/lang/String;

    invoke-direct {v0, v9, v1}, Landroid/gov/nist/javax/sip/stack/DefaultRouter;-><init>(Landroid/javax/sip/SipStack;Ljava/lang/String;)V

    iput-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->defaultRouter:Landroid/gov/nist/javax/sip/stack/DefaultRouter;

    .line 872
    const-string/jumbo v0, "android.javax.sip.ROUTER_PATH"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 874
    .local v0, "routerPath":Ljava/lang/String;
    if-nez v0, :cond_3

    .line 875
    const-string/jumbo v0, "android.gov.nist.javax.sip.stack.DefaultRouter"

    move-object/from16 v17, v0

    goto :goto_3

    .line 874
    :cond_3
    move-object/from16 v17, v0

    .line 878
    .end local v0    # "routerPath":Ljava/lang/String;
    .local v17, "routerPath":Ljava/lang/String;
    :goto_3
    :try_start_3
    invoke-static/range {v17 .. v17}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 879
    .local v0, "routerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    .line 880
    .restart local v2    # "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-class v3, Landroid/javax/sip/SipStack;

    aput-object v3, v2, v8

    .line 881
    const-class v3, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v3, v2, v6

    .line 882
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 883
    .restart local v3    # "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v1, v1, [Ljava/lang/Object;

    .line 884
    .local v1, "args":[Ljava/lang/Object;
    aput-object v9, v1, v8

    .line 885
    iget-object v4, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->outboundProxy:Ljava/lang/String;

    aput-object v4, v1, v6

    .line 886
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/address/Router;

    .line 887
    .local v4, "router":Landroid/javax/sip/address/Router;
    invoke-super {v9, v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setRouter(Landroid/javax/sip/address/Router;)V
    :try_end_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2a

    .line 900
    .end local v0    # "routerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "args":[Ljava/lang/Object;
    .end local v2    # "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "router":Landroid/javax/sip/address/Router;
    nop

    .line 903
    const-string/jumbo v0, "android.javax.sip.USE_ROUTER_FOR_ALL_URIS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 905
    .local v5, "useRouterForAll":Ljava/lang/String;
    iput-boolean v6, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->useRouterForAll:Z

    .line 906
    const-string/jumbo v4, "true"

    if-eqz v5, :cond_4

    .line 907
    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->useRouterForAll:Z

    .line 914
    :cond_4
    const-string/jumbo v0, "android.javax.sip.EXTENSION_METHODS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 917
    .local v3, "extensionMethods":Ljava/lang/String;
    if-eqz v3, :cond_6

    .line 918
    new-instance v0, Ljava/util/StringTokenizer;

    invoke-direct {v0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 920
    .local v0, "st":Ljava/util/StringTokenizer;
    :goto_4
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 921
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 922
    .local v1, "em":Ljava/lang/String;
    const-string v2, "BYE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "INVITE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string/jumbo v2, "SUBSCRIBE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "NOTIFY"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "ACK"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "OPTIONS"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 931
    invoke-virtual {v9, v1}, Landroid/gov/nist/javax/sip/SipStackImpl;->addExtensionMethod(Ljava/lang/String;)V

    .line 932
    .end local v1    # "em":Ljava/lang/String;
    goto :goto_4

    .line 928
    .restart local v1    # "em":Ljava/lang/String;
    :cond_5
    new-instance v2, Landroid/javax/sip/PeerUnavailableException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bad extension method "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 936
    .end local v0    # "st":Ljava/util/StringTokenizer;
    .end local v1    # "em":Ljava/lang/String;
    :cond_6
    const-string/jumbo v0, "android.gov.nist.javax.sip.TLS_CLIENT_AUTH_TYPE"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 937
    .local v2, "clientAuthType":Ljava/lang/String;
    if-eqz v2, :cond_7

    .line 938
    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/ClientAuthType;->valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    move-result-object v0

    iput-object v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->clientAuth:Landroid/gov/nist/javax/sip/stack/ClientAuthType;

    .line 939
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "using "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " tls auth policy"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 942
    :cond_7
    const-string/jumbo v0, "javax.net.ssl.keyStore"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 944
    .local v18, "keyStoreFile":Ljava/lang/String;
    const-string/jumbo v0, "javax.net.ssl.trustStore"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 946
    .local v0, "trustStoreFile":Ljava/lang/String;
    const/4 v6, 0x0

    if-eqz v18, :cond_c

    .line 947
    if-nez v0, :cond_8

    .line 948
    move-object/from16 v0, v18

    move-object/from16 v19, v0

    goto :goto_5

    .line 947
    :cond_8
    move-object/from16 v19, v0

    .line 950
    .end local v0    # "trustStoreFile":Ljava/lang/String;
    .local v19, "trustStoreFile":Ljava/lang/String;
    :goto_5
    const-string/jumbo v0, "javax.net.ssl.keyStorePassword"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 952
    .local v1, "keyStorePassword":Ljava/lang/String;
    const-string/jumbo v0, "javax.net.ssl.trustStorePassword"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 955
    .local v20, "trustStorePassword":Ljava/lang/String;
    const-string/jumbo v0, "javax.net.ssl.keyStoreType"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 957
    .local v21, "keyStoreType":Ljava/lang/String;
    const-string/jumbo v0, "javax.net.ssl.trustStoreType"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 960
    .local v0, "trustStoreType":Ljava/lang/String;
    if-nez v0, :cond_9

    move-object/from16 v0, v21

    :cond_9
    move-object/from16 v22, v0

    .line 963
    .end local v0    # "trustStoreType":Ljava/lang/String;
    .local v22, "trustStoreType":Ljava/lang/String;
    :try_start_4
    new-instance v0, Landroid/gov/nist/core/net/SslNetworkLayer;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    if-eqz v1, :cond_a

    :try_start_5
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v23

    goto :goto_6

    .line 970
    :catch_1
    move-exception v0

    move-object/from16 v25, v1

    move-object/from16 v26, v2

    move-object/from16 v27, v3

    move-object/from16 v29, v5

    move-object/from16 v30, v7

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    const/4 v14, 0x1

    move-object v13, v4

    goto :goto_8

    .line 963
    :cond_a
    move-object/from16 v23, v6

    :goto_6
    if-eqz v20, :cond_b

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->toCharArray()[C

    move-result-object v24
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_7

    :cond_b
    move-object/from16 v24, v6

    :goto_7
    move-object/from16 v25, v1

    .end local v1    # "keyStorePassword":Ljava/lang/String;
    .local v25, "keyStorePassword":Ljava/lang/String;
    move-object v1, v0

    move-object/from16 v26, v2

    .end local v2    # "clientAuthType":Ljava/lang/String;
    .local v26, "clientAuthType":Ljava/lang/String;
    move-object/from16 v2, p0

    move-object/from16 v27, v3

    .end local v3    # "extensionMethods":Ljava/lang/String;
    .local v27, "extensionMethods":Ljava/lang/String;
    move-object/from16 v3, v19

    move-object/from16 v28, v13

    move-object v13, v4

    .end local v13    # "address":Ljava/lang/String;
    .local v28, "address":Ljava/lang/String;
    move-object/from16 v4, v18

    move-object/from16 v29, v5

    .end local v5    # "useRouterForAll":Ljava/lang/String;
    .local v29, "useRouterForAll":Ljava/lang/String;
    move-object/from16 v5, v23

    move-object/from16 v23, v14

    const/4 v14, 0x1

    .end local v14    # "name":Ljava/lang/String;
    .local v23, "name":Ljava/lang/String;
    move-object/from16 v6, v24

    move-object/from16 v30, v7

    move-object/from16 v7, v21

    move-object/from16 v8, v22

    :try_start_6
    invoke-direct/range {v1 .. v8}, Landroid/gov/nist/core/net/SslNetworkLayer;-><init>(Landroid/gov/nist/javax/sip/SipStackImpl;Ljava/lang/String;Ljava/lang/String;[C[CLjava/lang/String;Ljava/lang/String;)V

    iput-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->networkLayer:Landroid/gov/nist/core/net/NetworkLayer;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 973
    goto :goto_9

    .line 970
    :catch_2
    move-exception v0

    goto :goto_8

    .end local v23    # "name":Ljava/lang/String;
    .end local v25    # "keyStorePassword":Ljava/lang/String;
    .end local v26    # "clientAuthType":Ljava/lang/String;
    .end local v27    # "extensionMethods":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .end local v29    # "useRouterForAll":Ljava/lang/String;
    .restart local v1    # "keyStorePassword":Ljava/lang/String;
    .restart local v2    # "clientAuthType":Ljava/lang/String;
    .restart local v3    # "extensionMethods":Ljava/lang/String;
    .restart local v5    # "useRouterForAll":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :catch_3
    move-exception v0

    move-object/from16 v25, v1

    move-object/from16 v26, v2

    move-object/from16 v27, v3

    move-object/from16 v29, v5

    move-object/from16 v30, v7

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    const/4 v14, 0x1

    move-object v13, v4

    .line 971
    .end local v1    # "keyStorePassword":Ljava/lang/String;
    .end local v2    # "clientAuthType":Ljava/lang/String;
    .end local v3    # "extensionMethods":Ljava/lang/String;
    .end local v5    # "useRouterForAll":Ljava/lang/String;
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .local v0, "e1":Ljava/lang/Exception;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v25    # "keyStorePassword":Ljava/lang/String;
    .restart local v26    # "clientAuthType":Ljava/lang/String;
    .restart local v27    # "extensionMethods":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    .restart local v29    # "useRouterForAll":Ljava/lang/String;
    :goto_8
    sget-object v1, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "could not instantiate SSL networking"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_9

    .line 946
    .end local v19    # "trustStoreFile":Ljava/lang/String;
    .end local v20    # "trustStorePassword":Ljava/lang/String;
    .end local v21    # "keyStoreType":Ljava/lang/String;
    .end local v22    # "trustStoreType":Ljava/lang/String;
    .end local v23    # "name":Ljava/lang/String;
    .end local v25    # "keyStorePassword":Ljava/lang/String;
    .end local v26    # "clientAuthType":Ljava/lang/String;
    .end local v27    # "extensionMethods":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .end local v29    # "useRouterForAll":Ljava/lang/String;
    .local v0, "trustStoreFile":Ljava/lang/String;
    .restart local v2    # "clientAuthType":Ljava/lang/String;
    .restart local v3    # "extensionMethods":Ljava/lang/String;
    .restart local v5    # "useRouterForAll":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :cond_c
    move-object/from16 v26, v2

    move-object/from16 v27, v3

    move-object/from16 v29, v5

    move-object/from16 v30, v7

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    const/4 v14, 0x1

    move-object v13, v4

    .end local v2    # "clientAuthType":Ljava/lang/String;
    .end local v3    # "extensionMethods":Ljava/lang/String;
    .end local v5    # "useRouterForAll":Ljava/lang/String;
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v26    # "clientAuthType":Ljava/lang/String;
    .restart local v27    # "extensionMethods":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    .restart local v29    # "useRouterForAll":Ljava/lang/String;
    move-object/from16 v19, v0

    .line 977
    .end local v0    # "trustStoreFile":Ljava/lang/String;
    .restart local v19    # "trustStoreFile":Ljava/lang/String;
    :goto_9
    const-string/jumbo v0, "android.javax.sip.AUTOMATIC_DIALOG_SUPPORT"

    const-string/jumbo v1, "on"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogSupportEnabled:Z

    .line 981
    const-string/jumbo v0, "android.gov.nist.javax.sip.AUTOMATIC_DIALOG_ERROR_HANDLING"

    invoke-virtual {v12, v0, v13}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogErrorHandlingEnabled:Z

    .line 984
    iget-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogSupportEnabled:Z

    if-eqz v0, :cond_d

    .line 985
    iput-boolean v14, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogErrorHandlingEnabled:Z

    .line 988
    :cond_d
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_LISTENER_RESPONSE_TIME"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    if-eqz v1, :cond_f

    .line 990
    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxListenerResponseTime:I

    .line 993
    iget v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxListenerResponseTime:I

    if-lez v0, :cond_e

    goto :goto_a

    .line 994
    :cond_e
    new-instance v0, Landroid/javax/sip/PeerUnavailableException;

    const-string v1, "Bad configuration parameter android.gov.nist.javax.sip.MAX_LISTENER_RESPONSE_TIME : should be positive"

    invoke-direct {v0, v1}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 997
    :cond_f
    iput v2, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxListenerResponseTime:I

    .line 1000
    :goto_a
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_TX_LIFETIME_INVITE"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_11

    .line 1002
    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeInvite:I

    .line 1005
    invoke-super/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxTxLifetimeInvite()I

    move-result v0

    if-lez v0, :cond_10

    goto :goto_b

    .line 1006
    :cond_10
    new-instance v0, Landroid/javax/sip/PeerUnavailableException;

    const-string v1, "Bad configuration parameter android.gov.nist.javax.sip.MAX_TX_LIFETIME_INVITE : should be positive"

    invoke-direct {v0, v1}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1009
    :cond_11
    iput v2, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeInvite:I

    .line 1013
    :goto_b
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_TX_LIFETIME_NON_INVITE"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_13

    .line 1015
    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeNonInvite:I

    .line 1018
    invoke-super/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getMaxTxLifetimeNonInvite()I

    move-result v0

    if-lez v0, :cond_12

    goto :goto_c

    .line 1019
    :cond_12
    new-instance v0, Landroid/javax/sip/PeerUnavailableException;

    const-string v1, "Bad configuration parameter android.gov.nist.javax.sip.MAX_TX_LIFETIME_NON_INVITE : should be positive"

    invoke-direct {v0, v1}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1022
    :cond_13
    iput v2, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxTxLifetimeNonInvite:I

    .line 1026
    :goto_c
    const-string/jumbo v0, "android.gov.nist.javax.sip.DELIVER_TERMINATED_EVENT_FOR_ACK"

    const-string/jumbo v1, "false"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v9, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->setDeliverTerminatedEventForAck(Z)V

    .line 1031
    const-string/jumbo v0, "android.gov.nist.javax.sip.DELIVER_UNSOLICITED_NOTIFY"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setDeliverUnsolicitedNotify(Z)V

    .line 1035
    const-string/jumbo v0, "android.javax.sip.FORKABLE_EVENTS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1037
    .local v2, "forkedSubscriptions":Ljava/lang/String;
    if-eqz v2, :cond_14

    .line 1038
    new-instance v0, Ljava/util/StringTokenizer;

    invoke-direct {v0, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 1039
    .local v0, "st":Ljava/util/StringTokenizer;
    :goto_d
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_14

    .line 1040
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 1041
    .local v3, "nextEvent":Ljava/lang/String;
    iget-object v4, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->forkedEvents:Ljava/util/HashSet;

    invoke-virtual {v4, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1042
    .end local v3    # "nextEvent":Ljava/lang/String;
    goto :goto_d

    .line 1046
    .end local v0    # "st":Ljava/util/StringTokenizer;
    :cond_14
    const-string/jumbo v0, "android.gov.nist.javax.sip.TLS_SECURITY_POLICY"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1047
    .local v0, "tlsPolicyPath":Ljava/lang/String;
    if-nez v0, :cond_15

    .line 1048
    const-string/jumbo v0, "android.gov.nist.javax.sip.stack.DefaultTlsSecurityPolicy"

    .line 1049
    sget-object v3, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v4, "using default tls security policy"

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    move-object v3, v0

    goto :goto_e

    .line 1047
    :cond_15
    move-object v3, v0

    .line 1052
    .end local v0    # "tlsPolicyPath":Ljava/lang/String;
    .local v3, "tlsPolicyPath":Ljava/lang/String;
    :goto_e
    :try_start_7
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1053
    .local v0, "tlsPolicyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    .line 1054
    .local v5, "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {v0, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    .line 1055
    .local v6, "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v7, v4, [Ljava/lang/Object;

    .line 1056
    .local v7, "args":[Ljava/lang/Object;
    invoke-virtual {v6, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/gov/nist/javax/sip/TlsSecurityPolicy;

    iput-object v8, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->tlsSecurityPolicy:Landroid/gov/nist/javax/sip/TlsSecurityPolicy;
    :try_end_7
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7 .. :try_end_7} :catch_29
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_28

    .line 1065
    .end local v0    # "tlsPolicyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "constructorArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v7    # "args":[Ljava/lang/Object;
    nop

    .line 1074
    const-string/jumbo v5, "android.gov.nist.javax.sip.NETWORK_LAYER"

    .line 1076
    .local v5, "NETWORK_LAYER_KEY":Ljava/lang/String;
    const-string/jumbo v0, "android.gov.nist.javax.sip.NETWORK_LAYER"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 1077
    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1080
    .local v6, "path":Ljava/lang/String;
    :try_start_8
    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1081
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v7, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v7

    .line 1082
    .local v7, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v8, v4, [Ljava/lang/Object;

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/gov/nist/core/net/NetworkLayer;

    iput-object v8, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->networkLayer:Landroid/gov/nist/core/net/NetworkLayer;

    .line 1083
    iget-object v8, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->networkLayer:Landroid/gov/nist/core/net/NetworkLayer;

    invoke-interface {v8, v9}, Landroid/gov/nist/core/net/NetworkLayer;->setSipStack(Landroid/gov/nist/javax/sip/SipStackImpl;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .line 1088
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    goto :goto_f

    .line 1084
    :catch_4
    move-exception v0

    .line 1085
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "can\'t find or instantiate NetworkLayer implementation: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4, v0}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1091
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v6    # "path":Ljava/lang/String;
    :cond_16
    :goto_f
    const-string/jumbo v6, "android.gov.nist.javax.sip.ADDRESS_RESOLVER"

    .line 1093
    .local v6, "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    const-string/jumbo v0, "android.gov.nist.javax.sip.ADDRESS_RESOLVER"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 1094
    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1097
    .local v7, "path":Ljava/lang/String;
    :try_start_9
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1098
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v8, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    .line 1099
    .local v8, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v10, v4, [Ljava/lang/Object;

    invoke-virtual {v8, v10}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/gov/nist/core/net/AddressResolver;

    iput-object v10, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->addressResolver:Landroid/gov/nist/core/net/AddressResolver;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    .line 1105
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    goto :goto_10

    .line 1101
    :catch_5
    move-exception v0

    .line 1102
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "can\'t find or instantiate AddressResolver implementation: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4, v0}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1108
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v7    # "path":Ljava/lang/String;
    :cond_17
    :goto_10
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_CONNECTIONS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1110
    .local v7, "maxConnections":Ljava/lang/String;
    if-eqz v7, :cond_18

    .line 1112
    :try_start_a
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v7}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->maxConnections:I
    :try_end_a
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_a} :catch_6

    .line 1117
    goto :goto_11

    .line 1113
    :catch_6
    move-exception v0

    .line 1114
    .local v0, "ex":Ljava/lang/NumberFormatException;
    sget-object v8, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v8}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v8

    if-eqz v8, :cond_18

    .line 1115
    sget-object v8, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "max connections - bad value "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1120
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_18
    :goto_11
    const-string/jumbo v0, "android.gov.nist.javax.sip.THREAD_POOL_SIZE"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1122
    .local v8, "threadPoolSize":Ljava/lang/String;
    if-eqz v8, :cond_19

    .line 1124
    :try_start_b
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v8}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->threadPoolSize:I
    :try_end_b
    .catch Ljava/lang/NumberFormatException; {:try_start_b .. :try_end_b} :catch_7

    .line 1129
    goto :goto_12

    .line 1125
    :catch_7
    move-exception v0

    .line 1126
    .restart local v0    # "ex":Ljava/lang/NumberFormatException;
    sget-object v10, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v10}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v10

    if-eqz v10, :cond_19

    .line 1127
    sget-object v10, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "thread pool size - bad value "

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v10, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1132
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_19
    :goto_12
    const-string/jumbo v0, "android.gov.nist.javax.sip.CONGESTION_CONTROL_TIMEOUT"

    const-string v4, "8000"

    invoke-virtual {v12, v0, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 1136
    .local v4, "congetstionControlTimeout":I
    invoke-super {v9, v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setStackCongestionControlTimeout(I)V

    .line 1138
    const-string/jumbo v0, "android.gov.nist.javax.sip.TCP_POST_PARSING_THREAD_POOL_SIZE"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1140
    .local v10, "tcpTreadPoolSize":Ljava/lang/String;
    if-eqz v10, :cond_1b

    .line 1142
    :try_start_c
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v10}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1143
    .local v0, "threads":I
    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setTcpPostParsingThreadPoolSize(I)V

    .line 1144
    invoke-static {v9, v0, v4}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->setPostParseExcutorSize(Landroid/gov/nist/javax/sip/SipStackImpl;II)V
    :try_end_c
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_c} :catch_8

    .line 1149
    .end local v0    # "threads":I
    move-object/from16 v21, v2

    goto :goto_13

    .line 1145
    :catch_8
    move-exception v0

    .line 1146
    .local v0, "ex":Ljava/lang/NumberFormatException;
    sget-object v11, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v11

    if-eqz v11, :cond_1a

    .line 1147
    sget-object v11, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v2

    .end local v2    # "forkedSubscriptions":Ljava/lang/String;
    .local v21, "forkedSubscriptions":Ljava/lang/String;
    const-string/jumbo v2, "TCP post-parse thread pool size - bad value "

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v14, " : "

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v11, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_13

    .line 1146
    .end local v21    # "forkedSubscriptions":Ljava/lang/String;
    .restart local v2    # "forkedSubscriptions":Ljava/lang/String;
    :cond_1a
    move-object/from16 v21, v2

    .end local v2    # "forkedSubscriptions":Ljava/lang/String;
    .restart local v21    # "forkedSubscriptions":Ljava/lang/String;
    goto :goto_13

    .line 1140
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    .end local v21    # "forkedSubscriptions":Ljava/lang/String;
    .restart local v2    # "forkedSubscriptions":Ljava/lang/String;
    :cond_1b
    move-object/from16 v21, v2

    .line 1152
    .end local v2    # "forkedSubscriptions":Ljava/lang/String;
    .restart local v21    # "forkedSubscriptions":Ljava/lang/String;
    :goto_13
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_SERVER_TRANSACTIONS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1154
    .local v2, "serverTransactionTableSize":Ljava/lang/String;
    const-string/jumbo v11, "transaction table size - bad value "

    const/16 v14, 0x64

    if-eqz v2, :cond_1d

    .line 1156
    :try_start_d
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->serverTransactionTableHighwaterMark:I

    .line 1158
    iget v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->serverTransactionTableHighwaterMark:I

    mul-int/lit8 v0, v0, 0x50

    div-int/2addr v0, v14

    iput v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->serverTransactionTableLowaterMark:I
    :try_end_d
    .catch Ljava/lang/NumberFormatException; {:try_start_d .. :try_end_d} :catch_9

    .line 1166
    move-object/from16 v24, v2

    move/from16 v25, v4

    goto :goto_15

    .line 1160
    :catch_9
    move-exception v0

    .line 1161
    .restart local v0    # "ex":Ljava/lang/NumberFormatException;
    sget-object v22, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface/range {v22 .. v22}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v22

    if-eqz v22, :cond_1c

    .line 1162
    sget-object v14, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v24, v2

    .end local v2    # "serverTransactionTableSize":Ljava/lang/String;
    .local v24, "serverTransactionTableSize":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v25, v4

    .end local v4    # "congetstionControlTimeout":I
    .local v25, "congetstionControlTimeout":I
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v14, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_14

    .line 1161
    .end local v24    # "serverTransactionTableSize":Ljava/lang/String;
    .end local v25    # "congetstionControlTimeout":I
    .restart local v2    # "serverTransactionTableSize":Ljava/lang/String;
    .restart local v4    # "congetstionControlTimeout":I
    :cond_1c
    move-object/from16 v24, v2

    move/from16 v25, v4

    .line 1166
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    .end local v2    # "serverTransactionTableSize":Ljava/lang/String;
    .end local v4    # "congetstionControlTimeout":I
    .restart local v24    # "serverTransactionTableSize":Ljava/lang/String;
    .restart local v25    # "congetstionControlTimeout":I
    :goto_14
    goto :goto_15

    .line 1170
    .end local v24    # "serverTransactionTableSize":Ljava/lang/String;
    .end local v25    # "congetstionControlTimeout":I
    .restart local v2    # "serverTransactionTableSize":Ljava/lang/String;
    .restart local v4    # "congetstionControlTimeout":I
    :cond_1d
    move-object/from16 v24, v2

    move/from16 v25, v4

    .end local v2    # "serverTransactionTableSize":Ljava/lang/String;
    .end local v4    # "congetstionControlTimeout":I
    .restart local v24    # "serverTransactionTableSize":Ljava/lang/String;
    .restart local v25    # "congetstionControlTimeout":I
    const/4 v2, 0x1

    iput-boolean v2, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->unlimitedServerTransactionTableSize:Z

    .line 1173
    :goto_15
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_CLIENT_TRANSACTIONS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1175
    .local v2, "clientTransactionTableSize":Ljava/lang/String;
    if-eqz v2, :cond_1f

    .line 1177
    :try_start_e
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->clientTransactionTableHiwaterMark:I

    .line 1179
    iget v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->clientTransactionTableLowaterMark:I

    mul-int/lit8 v0, v0, 0x50

    const/16 v4, 0x64

    div-int/2addr v0, v4

    iput v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->clientTransactionTableLowaterMark:I
    :try_end_e
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_e} :catch_a

    goto :goto_16

    .line 1181
    :catch_a
    move-exception v0

    .line 1182
    .restart local v0    # "ex":Ljava/lang/NumberFormatException;
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 1183
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v4, v11}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1187
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_1e
    :goto_16
    goto :goto_17

    .line 1189
    :cond_1f
    const/4 v4, 0x1

    iput-boolean v4, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->unlimitedClientTransactionTableSize:Z

    .line 1197
    :goto_17
    const-string/jumbo v4, "android.gov.nist.javax.sip.SECURITY_MANAGER_PROVIDER"

    .line 1199
    .local v4, "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    const-string/jumbo v0, "android.gov.nist.javax.sip.SECURITY_MANAGER_PROVIDER"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_20

    .line 1200
    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1203
    .local v11, "path":Ljava/lang/String;
    :try_start_f
    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_c

    .line 1204
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v32, v2

    const/4 v14, 0x0

    .end local v2    # "clientTransactionTableSize":Ljava/lang/String;
    .local v32, "clientTransactionTableSize":Ljava/lang/String;
    :try_start_10
    new-array v2, v14, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 1205
    .local v2, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    move-object/from16 v33, v0

    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v33, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v0, v14, [Ljava/lang/Object;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/core/net/SecurityManagerProvider;

    iput-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_b

    .line 1210
    .end local v2    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v33    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    nop

    .line 1211
    .end local v11    # "path":Ljava/lang/String;
    goto :goto_19

    .line 1206
    .restart local v11    # "path":Ljava/lang/String;
    :catch_b
    move-exception v0

    goto :goto_18

    .end local v32    # "clientTransactionTableSize":Ljava/lang/String;
    .local v2, "clientTransactionTableSize":Ljava/lang/String;
    :catch_c
    move-exception v0

    move-object/from16 v32, v2

    .line 1207
    .end local v2    # "clientTransactionTableSize":Ljava/lang/String;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v32    # "clientTransactionTableSize":Ljava/lang/String;
    :goto_18
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "can\'t find or instantiate SecurityManagerProvider implementation: "

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1212
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v11    # "path":Ljava/lang/String;
    .end local v32    # "clientTransactionTableSize":Ljava/lang/String;
    .restart local v2    # "clientTransactionTableSize":Ljava/lang/String;
    :cond_20
    move-object/from16 v32, v2

    .end local v2    # "clientTransactionTableSize":Ljava/lang/String;
    .restart local v32    # "clientTransactionTableSize":Ljava/lang/String;
    new-instance v0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;

    invoke-direct {v0}, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;-><init>()V

    iput-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    .line 1214
    :goto_19
    :try_start_11
    iget-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->securityManagerProvider:Landroid/gov/nist/core/net/SecurityManagerProvider;

    invoke-interface {v0, v12}, Landroid/gov/nist/core/net/SecurityManagerProvider;->init(Ljava/util/Properties;)V
    :try_end_11
    .catch Ljava/security/GeneralSecurityException; {:try_start_11 .. :try_end_11} :catch_27
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_26

    .line 1219
    nop

    .line 1221
    const/4 v2, 0x1

    iput-boolean v2, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheServerConnections:Z

    .line 1222
    const-string/jumbo v0, "android.gov.nist.javax.sip.CACHE_SERVER_CONNECTIONS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1225
    .local v2, "flag":Ljava/lang/String;
    if-eqz v2, :cond_21

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 1226
    const/4 v11, 0x0

    iput-boolean v11, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheServerConnections:Z

    .line 1229
    :cond_21
    const/4 v11, 0x1

    iput-boolean v11, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheClientConnections:Z

    .line 1230
    const-string/jumbo v0, "android.gov.nist.javax.sip.CACHE_CLIENT_CONNECTIONS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1233
    .local v14, "cacheflag":Ljava/lang/String;
    if-eqz v14, :cond_22

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 1234
    const/4 v11, 0x0

    iput-boolean v11, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cacheClientConnections:Z

    .line 1237
    :cond_22
    const-string/jumbo v0, "android.gov.nist.javax.sip.READ_TIMEOUT"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1239
    .local v11, "readTimeout":Ljava/lang/String;
    if-eqz v11, :cond_25

    .line 1242
    :try_start_12
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_12} :catch_10

    .line 1243
    .local v0, "rt":I
    move-object/from16 v33, v2

    const/16 v2, 0x64

    .end local v2    # "flag":Ljava/lang/String;
    .local v33, "flag":Ljava/lang/String;
    if-lt v0, v2, :cond_23

    .line 1244
    :try_start_13
    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->readTimeout:I
    :try_end_13
    .catch Ljava/lang/NumberFormatException; {:try_start_13 .. :try_end_13} :catch_d

    move-object/from16 v35, v4

    goto :goto_1a

    .line 1248
    .end local v0    # "rt":I
    :catch_d
    move-exception v0

    move-object/from16 v35, v4

    goto :goto_1b

    .line 1246
    .restart local v0    # "rt":I
    :cond_23
    :try_start_14
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move/from16 v34, v0

    .end local v0    # "rt":I
    .local v34, "rt":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_14
    .catch Ljava/lang/NumberFormatException; {:try_start_14 .. :try_end_14} :catch_f

    move-object/from16 v35, v4

    .end local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .local v35, "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    :try_start_15
    const-string/jumbo v4, "Value too low "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/lang/NumberFormatException; {:try_start_15 .. :try_end_15} :catch_e

    .line 1252
    .end local v34    # "rt":I
    :goto_1a
    goto :goto_1c

    .line 1248
    :catch_e
    move-exception v0

    goto :goto_1b

    .end local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    :catch_f
    move-exception v0

    move-object/from16 v35, v4

    .end local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    goto :goto_1b

    .end local v33    # "flag":Ljava/lang/String;
    .end local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v2    # "flag":Ljava/lang/String;
    .restart local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    :catch_10
    move-exception v0

    move-object/from16 v33, v2

    move-object/from16 v35, v4

    .line 1250
    .end local v2    # "flag":Ljava/lang/String;
    .end local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    .restart local v33    # "flag":Ljava/lang/String;
    .restart local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    :goto_1b
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 1251
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v34, v0

    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .local v34, "nfe":Ljava/lang/NumberFormatException;
    const-string v0, "Bad read timeout "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_1c

    .line 1250
    .end local v34    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v0    # "nfe":Ljava/lang/NumberFormatException;
    :cond_24
    move-object/from16 v34, v0

    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v34    # "nfe":Ljava/lang/NumberFormatException;
    goto :goto_1c

    .line 1239
    .end local v33    # "flag":Ljava/lang/String;
    .end local v34    # "nfe":Ljava/lang/NumberFormatException;
    .end local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v2    # "flag":Ljava/lang/String;
    .restart local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    :cond_25
    move-object/from16 v33, v2

    move-object/from16 v35, v4

    .line 1255
    .end local v2    # "flag":Ljava/lang/String;
    .end local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v33    # "flag":Ljava/lang/String;
    .restart local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    :goto_1c
    const-string/jumbo v0, "android.gov.nist.javax.sip.CONNECTION_TIMEOUT"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1257
    .local v2, "connTimeout":Ljava/lang/String;
    if-eqz v2, :cond_28

    .line 1260
    :try_start_16
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_16
    .catch Ljava/lang/NumberFormatException; {:try_start_16 .. :try_end_16} :catch_13

    .line 1261
    .local v0, "rt":I
    const/16 v4, 0x64

    if-lt v0, v4, :cond_26

    .line 1262
    :try_start_17
    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->connTimeout:I
    :try_end_17
    .catch Ljava/lang/NumberFormatException; {:try_start_17 .. :try_end_17} :catch_11

    move-object/from16 v34, v2

    goto :goto_1d

    .line 1266
    .end local v0    # "rt":I
    :catch_11
    move-exception v0

    move-object/from16 v34, v2

    goto :goto_1e

    .line 1264
    .restart local v0    # "rt":I
    :cond_26
    :try_start_18
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move/from16 v22, v0

    .end local v0    # "rt":I
    .local v22, "rt":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_18
    .catch Ljava/lang/NumberFormatException; {:try_start_18 .. :try_end_18} :catch_13

    move-object/from16 v34, v2

    .end local v2    # "connTimeout":Ljava/lang/String;
    .local v34, "connTimeout":Ljava/lang/String;
    :try_start_19
    const-string/jumbo v2, "Value too low "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_19
    .catch Ljava/lang/NumberFormatException; {:try_start_19 .. :try_end_19} :catch_12

    .line 1270
    .end local v22    # "rt":I
    :goto_1d
    goto :goto_1f

    .line 1266
    :catch_12
    move-exception v0

    goto :goto_1e

    .end local v34    # "connTimeout":Ljava/lang/String;
    .restart local v2    # "connTimeout":Ljava/lang/String;
    :catch_13
    move-exception v0

    move-object/from16 v34, v2

    .line 1268
    .end local v2    # "connTimeout":Ljava/lang/String;
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    .restart local v34    # "connTimeout":Ljava/lang/String;
    :goto_1e
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 1269
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v22, v0

    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .local v22, "nfe":Ljava/lang/NumberFormatException;
    const-string v0, "Bad conn timeout "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_1f

    .line 1268
    .end local v22    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v0    # "nfe":Ljava/lang/NumberFormatException;
    :cond_27
    move-object/from16 v22, v0

    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v22    # "nfe":Ljava/lang/NumberFormatException;
    goto :goto_1f

    .line 1257
    .end local v22    # "nfe":Ljava/lang/NumberFormatException;
    .end local v34    # "connTimeout":Ljava/lang/String;
    .restart local v2    # "connTimeout":Ljava/lang/String;
    :cond_28
    move-object/from16 v34, v2

    .line 1275
    .end local v2    # "connTimeout":Ljava/lang/String;
    .restart local v34    # "connTimeout":Ljava/lang/String;
    :goto_1f
    const-string/jumbo v0, "android.gov.nist.javax.sip.STUN_SERVER"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1278
    .local v2, "stunAddr":Ljava/lang/String;
    if-eqz v2, :cond_29

    .line 1279
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Ignoring obsolete property android.gov.nist.javax.sip.STUN_SERVER"

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 1283
    :cond_29
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_MESSAGE_SIZE"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1287
    .local v4, "maxMsgSize":Ljava/lang/String;
    if-eqz v4, :cond_2a

    .line 1288
    :try_start_1a
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v4}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxMessageSize:I

    .line 1289
    iget v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxMessageSize:I
    :try_end_1a
    .catch Ljava/lang/NumberFormatException; {:try_start_1a .. :try_end_1a} :catch_14

    move-object/from16 v22, v2

    .end local v2    # "stunAddr":Ljava/lang/String;
    .local v22, "stunAddr":Ljava/lang/String;
    const/16 v2, 0x1000

    if-ge v0, v2, :cond_2b

    .line 1290
    const/16 v0, 0x1000

    :try_start_1b
    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxMessageSize:I

    goto :goto_20

    .line 1295
    .end local v22    # "stunAddr":Ljava/lang/String;
    .restart local v2    # "stunAddr":Ljava/lang/String;
    :catch_14
    move-exception v0

    move-object/from16 v22, v2

    .end local v2    # "stunAddr":Ljava/lang/String;
    .restart local v22    # "stunAddr":Ljava/lang/String;
    goto :goto_21

    .line 1293
    .end local v22    # "stunAddr":Ljava/lang/String;
    .restart local v2    # "stunAddr":Ljava/lang/String;
    :cond_2a
    move-object/from16 v22, v2

    .end local v2    # "stunAddr":Ljava/lang/String;
    .restart local v22    # "stunAddr":Ljava/lang/String;
    const/4 v2, 0x0

    iput v2, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxMessageSize:I
    :try_end_1b
    .catch Ljava/lang/NumberFormatException; {:try_start_1b .. :try_end_1b} :catch_15

    .line 1299
    :cond_2b
    :goto_20
    move-object/from16 v36, v4

    move-object/from16 v37, v5

    goto :goto_22

    .line 1295
    :catch_15
    move-exception v0

    .line 1296
    .local v0, "ex":Ljava/lang/NumberFormatException;
    :goto_21
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 1297
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v36, v4

    .end local v4    # "maxMsgSize":Ljava/lang/String;
    .local v36, "maxMsgSize":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v37, v5

    .end local v5    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .local v37, "NETWORK_LAYER_KEY":Ljava/lang/String;
    const-string/jumbo v5, "maxMessageSize - bad value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_22

    .line 1296
    .end local v36    # "maxMsgSize":Ljava/lang/String;
    .end local v37    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .restart local v4    # "maxMsgSize":Ljava/lang/String;
    .restart local v5    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    :cond_2c
    move-object/from16 v36, v4

    move-object/from16 v37, v5

    .line 1301
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    .end local v4    # "maxMsgSize":Ljava/lang/String;
    .end local v5    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .restart local v36    # "maxMsgSize":Ljava/lang/String;
    .restart local v37    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    :goto_22
    const-string/jumbo v0, "android.gov.nist.javax.sip.REENTRANT_LISTENER"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1303
    .local v2, "rel":Ljava/lang/String;
    if-eqz v2, :cond_2d

    invoke-virtual {v13, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    const/4 v0, 0x1

    goto :goto_23

    :cond_2d
    const/4 v0, 0x0

    :goto_23
    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->reEntrantListener:Z

    .line 1306
    const-string/jumbo v0, "android.gov.nist.javax.sip.THREAD_AUDIT_INTERVAL_IN_MILLISECS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1308
    .local v4, "interval":Ljava/lang/String;
    if-eqz v4, :cond_2f

    .line 1310
    :try_start_1c
    new-instance v0, Landroid/gov/nist/core/ThreadAuditor;

    invoke-direct {v0}, Landroid/gov/nist/core/ThreadAuditor;-><init>()V

    iput-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->threadAuditor:Landroid/gov/nist/core/ThreadAuditor;

    .line 1313
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v0

    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v38
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_1c} :catch_17

    const-wide/16 v40, 0x2

    move-object/from16 v20, v6

    .end local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .local v20, "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    :try_start_1d
    div-long v5, v38, v40

    invoke-virtual {v0, v5, v6}, Landroid/gov/nist/core/ThreadAuditor;->setPingIntervalInMillisecs(J)V
    :try_end_1d
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_1d} :catch_16

    .line 1320
    move-object/from16 v38, v2

    goto :goto_25

    .line 1315
    :catch_16
    move-exception v0

    goto :goto_24

    .end local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .restart local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    :catch_17
    move-exception v0

    move-object/from16 v20, v6

    .line 1316
    .end local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .restart local v0    # "ex":Ljava/lang/NumberFormatException;
    .restart local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    :goto_24
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 1317
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v38, v2

    .end local v2    # "rel":Ljava/lang/String;
    .local v38, "rel":Ljava/lang/String;
    const-string/jumbo v2, "THREAD_AUDIT_INTERVAL_IN_MILLISECS - bad value ["

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v6, "] "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v5, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    goto :goto_25

    .line 1316
    .end local v38    # "rel":Ljava/lang/String;
    .restart local v2    # "rel":Ljava/lang/String;
    :cond_2e
    move-object/from16 v38, v2

    .end local v2    # "rel":Ljava/lang/String;
    .restart local v38    # "rel":Ljava/lang/String;
    goto :goto_25

    .line 1308
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    .end local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .end local v38    # "rel":Ljava/lang/String;
    .restart local v2    # "rel":Ljava/lang/String;
    .restart local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    :cond_2f
    move-object/from16 v38, v2

    move-object/from16 v20, v6

    .line 1324
    .end local v2    # "rel":Ljava/lang/String;
    .end local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .restart local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .restart local v38    # "rel":Ljava/lang/String;
    :goto_25
    const-string/jumbo v0, "android.gov.nist.javax.sip.PASS_INVITE_NON_2XX_ACK_TO_LISTENER"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v9, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->setNon2XXAckPassedToListener(Z)V

    .line 1332
    const-string/jumbo v0, "android.gov.nist.javax.sip.AUTO_GENERATE_TIMESTAMP"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->generateTimeStampHeader:Z

    .line 1337
    const-string/jumbo v0, "android.gov.nist.javax.sip.LOG_FACTORY"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1339
    .local v2, "messageLogFactoryClasspath":Ljava/lang/String;
    if-eqz v2, :cond_31

    .line 1341
    :try_start_1e
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1342
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    .line 1343
    .local v6, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v6, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/javax/sip/LogRecordFactory;

    iput-object v5, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->logRecordFactory:Landroid/gov/nist/javax/sip/LogRecordFactory;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_18

    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    goto :goto_26

    .line 1345
    :catch_18
    move-exception v0

    .line 1346
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v5

    if-eqz v5, :cond_30

    .line 1347
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "Bad configuration value for LOG_FACTORY -- using default logger"

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1350
    :cond_30
    new-instance v5, Landroid/gov/nist/javax/sip/stack/DefaultMessageLogFactory;

    invoke-direct {v5}, Landroid/gov/nist/javax/sip/stack/DefaultMessageLogFactory;-><init>()V

    iput-object v5, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->logRecordFactory:Landroid/gov/nist/javax/sip/LogRecordFactory;

    .line 1351
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_26
    goto :goto_27

    .line 1354
    :cond_31
    new-instance v0, Landroid/gov/nist/javax/sip/stack/DefaultMessageLogFactory;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/stack/DefaultMessageLogFactory;-><init>()V

    iput-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->logRecordFactory:Landroid/gov/nist/javax/sip/LogRecordFactory;

    .line 1357
    :goto_27
    const-string/jumbo v0, "android.gov.nist.javax.sip.COMPUTE_CONTENT_LENGTH_FROM_MESSAGE_BODY"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    .line 1360
    .local v5, "computeContentLength":Z
    invoke-static {v5}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->setComputeContentLengthFromMessage(Z)V

    .line 1363
    const-string/jumbo v0, "android.gov.nist.javax.sip.TLS_CLIENT_PROTOCOLS"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1365
    .local v6, "tlsClientProtocols":Ljava/lang/String;
    move-object/from16 v31, v2

    .end local v2    # "messageLogFactoryClasspath":Ljava/lang/String;
    .local v31, "messageLogFactoryClasspath":Ljava/lang/String;
    if-eqz v6, :cond_35

    .line 1369
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v2, "\" ,"

    invoke-direct {v0, v6, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1370
    .local v0, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    .line 1372
    .local v2, "protocols":[Ljava/lang/String;
    move-object/from16 v40, v4

    .end local v4    # "interval":Ljava/lang/String;
    .local v40, "interval":Ljava/lang/String;
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move/from16 v41, v5

    const/16 v5, 0x20

    .end local v5    # "computeContentLength":Z
    .local v41, "computeContentLength":Z
    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 1373
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v5, "TLS Client Protocols = "

    invoke-interface {v4, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1375
    :cond_32
    const/4 v4, 0x0

    .line 1376
    .local v4, "i":I
    :goto_28
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_34

    .line 1377
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 1378
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v42, v6

    const/16 v6, 0x20

    .end local v6    # "tlsClientProtocols":Ljava/lang/String;
    .local v42, "tlsClientProtocols":Ljava/lang/String;
    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 1379
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v43, v0

    .end local v0    # "st":Ljava/util/StringTokenizer;
    .local v43, "st":Ljava/util/StringTokenizer;
    const-string/jumbo v0, "TLS Client Protocol = "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object v6, v2, v4

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_29

    .line 1378
    .end local v43    # "st":Ljava/util/StringTokenizer;
    .restart local v0    # "st":Ljava/util/StringTokenizer;
    :cond_33
    move-object/from16 v43, v0

    .line 1382
    .end local v0    # "st":Ljava/util/StringTokenizer;
    .restart local v43    # "st":Ljava/util/StringTokenizer;
    :goto_29
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v6, v42

    move-object/from16 v0, v43

    goto :goto_28

    .line 1384
    .end local v42    # "tlsClientProtocols":Ljava/lang/String;
    .end local v43    # "st":Ljava/util/StringTokenizer;
    .restart local v0    # "st":Ljava/util/StringTokenizer;
    .restart local v6    # "tlsClientProtocols":Ljava/lang/String;
    :cond_34
    move-object/from16 v43, v0

    move-object/from16 v42, v6

    .end local v0    # "st":Ljava/util/StringTokenizer;
    .end local v6    # "tlsClientProtocols":Ljava/lang/String;
    .restart local v42    # "tlsClientProtocols":Ljava/lang/String;
    .restart local v43    # "st":Ljava/util/StringTokenizer;
    iput-object v2, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->enabledProtocols:[Ljava/lang/String;

    goto :goto_2a

    .line 1365
    .end local v2    # "protocols":[Ljava/lang/String;
    .end local v40    # "interval":Ljava/lang/String;
    .end local v41    # "computeContentLength":Z
    .end local v42    # "tlsClientProtocols":Ljava/lang/String;
    .end local v43    # "st":Ljava/util/StringTokenizer;
    .local v4, "interval":Ljava/lang/String;
    .restart local v5    # "computeContentLength":Z
    .restart local v6    # "tlsClientProtocols":Ljava/lang/String;
    :cond_35
    move-object/from16 v40, v4

    move/from16 v41, v5

    move-object/from16 v42, v6

    .line 1387
    .end local v4    # "interval":Ljava/lang/String;
    .end local v5    # "computeContentLength":Z
    .end local v6    # "tlsClientProtocols":Ljava/lang/String;
    .restart local v40    # "interval":Ljava/lang/String;
    .restart local v41    # "computeContentLength":Z
    .restart local v42    # "tlsClientProtocols":Ljava/lang/String;
    :goto_2a
    const-string/jumbo v0, "android.gov.nist.javax.sip.ENABLED_CIPHER_SUITES"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1389
    .local v2, "cipherSuitesStr":Ljava/lang/String;
    if-eqz v2, :cond_39

    .line 1393
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v4, "\" ,"

    invoke-direct {v0, v2, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1394
    .restart local v0    # "st":Ljava/util/StringTokenizer;
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    .line 1396
    .local v4, "newCipherSuites":[Ljava/lang/String;
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v6, 0x20

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_36

    .line 1397
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "Cipher Suites = "

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1399
    :cond_36
    const/4 v5, 0x0

    .line 1400
    .local v5, "i":I
    :goto_2b
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v6

    if-eqz v6, :cond_38

    .line 1401
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1402
    sget-object v6, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v43, v2

    const/16 v2, 0x20

    .end local v2    # "cipherSuitesStr":Ljava/lang/String;
    .local v43, "cipherSuitesStr":Ljava/lang/String;
    invoke-interface {v6, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_37

    .line 1403
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v44, v0

    .end local v0    # "st":Ljava/util/StringTokenizer;
    .local v44, "st":Ljava/util/StringTokenizer;
    const-string v0, "Cipher Suite = "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object v6, v4, v5

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_2c

    .line 1402
    .end local v44    # "st":Ljava/util/StringTokenizer;
    .restart local v0    # "st":Ljava/util/StringTokenizer;
    :cond_37
    move-object/from16 v44, v0

    .line 1406
    .end local v0    # "st":Ljava/util/StringTokenizer;
    .restart local v44    # "st":Ljava/util/StringTokenizer;
    :goto_2c
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v2, v43

    move-object/from16 v0, v44

    goto :goto_2b

    .line 1408
    .end local v43    # "cipherSuitesStr":Ljava/lang/String;
    .end local v44    # "st":Ljava/util/StringTokenizer;
    .restart local v0    # "st":Ljava/util/StringTokenizer;
    .restart local v2    # "cipherSuitesStr":Ljava/lang/String;
    :cond_38
    move-object/from16 v44, v0

    move-object/from16 v43, v2

    .end local v0    # "st":Ljava/util/StringTokenizer;
    .end local v2    # "cipherSuitesStr":Ljava/lang/String;
    .restart local v43    # "cipherSuitesStr":Ljava/lang/String;
    .restart local v44    # "st":Ljava/util/StringTokenizer;
    iput-object v4, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->cipherSuites:[Ljava/lang/String;

    goto :goto_2d

    .line 1389
    .end local v4    # "newCipherSuites":[Ljava/lang/String;
    .end local v5    # "i":I
    .end local v43    # "cipherSuitesStr":Ljava/lang/String;
    .end local v44    # "st":Ljava/util/StringTokenizer;
    .restart local v2    # "cipherSuitesStr":Ljava/lang/String;
    :cond_39
    move-object/from16 v43, v2

    .line 1411
    .end local v2    # "cipherSuitesStr":Ljava/lang/String;
    .restart local v43    # "cipherSuitesStr":Ljava/lang/String;
    :goto_2d
    const-string/jumbo v0, "android.gov.nist.javax.sip.RFC_2543_SUPPORT_ENABLED"

    invoke-virtual {v12, v0, v13}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->rfc2543Supported:Z

    .line 1415
    const-string/jumbo v0, "android.gov.nist.javax.sip.PATCH_SIP_WEBSOCKETS_HEADERS"

    invoke-virtual {v12, v0, v13}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setPatchWebSocketHeaders(Ljava/lang/Boolean;)V

    .line 1418
    const-string/jumbo v0, "android.gov.nist.javax.sip.ALWAYS_ADD_RPORT"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setPatchRport(Ljava/lang/Boolean;)V

    .line 1421
    const-string/jumbo v0, "android.gov.nist.javax.sip.NEVER_ADD_RECEIVED_RPORT"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setPatchReceivedRport(Z)V

    .line 1424
    const-string/jumbo v0, "android.gov.nist.javax.sip.CANCEL_CLIENT_TRANSACTION_CHECKED"

    invoke-virtual {v12, v0, v13}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->cancelClientTransactionChecked:Z

    .line 1428
    const-string/jumbo v0, "android.gov.nist.javax.sip.LOG_STACK_TRACE_ON_MESSAGE_SEND"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logStackTraceOnMessageSend:Z

    .line 1431
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v2, 0x20

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 1432
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "created Sip stack. Properties = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1434
    :cond_3a
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "/TIMESTAMP"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 1435
    .local v2, "in":Ljava/io/InputStream;
    if-eqz v2, :cond_3c

    .line 1436
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v4, v0

    .line 1440
    .local v4, "streamReader":Ljava/io/BufferedReader;
    :try_start_1f
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 1441
    .local v0, "buildTimeStamp":Ljava/lang/String;
    if-eqz v2, :cond_3b

    .line 1442
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 1444
    :cond_3b
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v0}, Landroid/gov/nist/core/StackLogger;->setBuildTimeStamp(Ljava/lang/String;)V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_1f} :catch_19

    .line 1447
    .end local v0    # "buildTimeStamp":Ljava/lang/String;
    goto :goto_2e

    .line 1445
    :catch_19
    move-exception v0

    .line 1446
    .local v0, "ex":Ljava/io/IOException;
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v6, "Could not open build timestamp."

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1450
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v4    # "streamReader":Ljava/io/BufferedReader;
    :cond_3c
    :goto_2e
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->MAX_DATAGRAM_SIZE:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v4, "android.gov.nist.javax.sip.RECEIVE_UDP_BUFFER_SIZE"

    invoke-virtual {v12, v4, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1453
    .local v0, "bufferSize":Ljava/lang/String;
    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v0}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1454
    .local v4, "bufferSizeInteger":I
    invoke-super {v9, v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setReceiveUdpBufferSize(I)V

    .line 1456
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->MAX_DATAGRAM_SIZE:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "android.gov.nist.javax.sip.SEND_UDP_BUFFER_SIZE"

    invoke-virtual {v12, v6, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1459
    .end local v0    # "bufferSize":Ljava/lang/String;
    .local v5, "bufferSize":Ljava/lang/String;
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v5}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1460
    invoke-super {v9, v4}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setSendUdpBufferSize(I)V

    .line 1462
    const-string/jumbo v0, "android.gov.nist.javax.sip.LINGER_TIMER"

    const-string v6, "8"

    invoke-virtual {v12, v0, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-super {v9, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->setConnectionLingerTimer(I)V

    .line 1465
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v6, "android.gov.nist.javax.sip.IS_BACK_TO_BACK_USER_AGENT"

    invoke-virtual {v12, v6, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isBackToBackUserAgent:Z

    .line 1469
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v6, "android.gov.nist.javax.sip.REJECT_STRAY_RESPONSES"

    invoke-virtual {v12, v6, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->checkBranchId:Z

    .line 1473
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v6, "android.gov.nist.javax.sip.DELIVER_TERMINATED_EVENT_FOR_NULL_DIALOG"

    invoke-virtual {v12, v6, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isDialogTerminatedEventDeliveredForNullDialog:Z

    .line 1477
    const-string/jumbo v0, "android.gov.nist.javax.sip.MAX_FORK_TIME_SECONDS"

    const-string v6, "0"

    invoke-virtual {v12, v0, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->maxForkTime:I

    .line 1480
    const-string/jumbo v0, "android.gov.nist.javax.sip.EARLY_DIALOG_TIMEOUT_SECONDS"

    const-string v6, "180"

    invoke-virtual {v12, v0, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->earlyDialogTimeout:I

    .line 1483
    const-string/jumbo v0, "android.gov.nist.javax.sip.MIN_KEEPALIVE_TIME_SECONDS"

    move-object/from16 v6, v30

    invoke-virtual {v12, v0, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    move/from16 v30, v4

    move-object v6, v5

    .end local v4    # "bufferSizeInteger":I
    .end local v5    # "bufferSize":Ljava/lang/String;
    .local v6, "bufferSize":Ljava/lang/String;
    .local v30, "bufferSizeInteger":I
    int-to-long v4, v0

    iput-wide v4, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->minKeepAliveInterval:J

    .line 1485
    const-string/jumbo v0, "android.gov.nist.javax.sip.DELIVER_RETRANSMITTED_ACK_TO_LISTENER"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->deliverRetransmittedAckToListener:Z

    .line 1488
    const-string/jumbo v0, "android.gov.nist.javax.sip.DIALOG_TIMEOUT_FACTOR"

    const-string v1, "64"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->dialogTimeoutFactor:I

    .line 1490
    const-class v0, Landroid/gov/nist/javax/sip/parser/StringMsgParserFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "android.gov.nist.javax.sip.MESSAGE_PARSER_FACTORY"

    invoke-virtual {v12, v1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1492
    .local v1, "messageParserFactoryName":Ljava/lang/String;
    :try_start_20
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/parser/MessageParserFactory;

    iput-object v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageParserFactory:Landroid/gov/nist/javax/sip/parser/MessageParserFactory;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_1a

    .line 1497
    goto :goto_2f

    .line 1493
    :catch_1a
    move-exception v0

    .line 1494
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v5, "Bad configuration value for android.gov.nist.javax.sip.MESSAGE_PARSER_FACTORY"

    invoke-interface {v4, v5, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1499
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2f
    const-class v0, Landroid/gov/nist/javax/sip/stack/OIOMessageProcessorFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v4, "android.gov.nist.javax.sip.MESSAGE_PROCESSOR_FACTORY"

    invoke-virtual {v12, v4, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1501
    .local v4, "messageProcessorFactoryName":Ljava/lang/String;
    :try_start_21
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;

    iput-object v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->messageProcessorFactory:Landroid/gov/nist/javax/sip/stack/MessageProcessorFactory;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_1b

    .line 1506
    move-object/from16 v44, v1

    goto :goto_30

    .line 1502
    :catch_1b
    move-exception v0

    .line 1503
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v44, v1

    .end local v1    # "messageParserFactoryName":Ljava/lang/String;
    .local v44, "messageParserFactoryName":Ljava/lang/String;
    const-string v1, "Bad configuration value for android.gov.nist.javax.sip.MESSAGE_PROCESSOR_FACTORY"

    invoke-interface {v5, v1, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1508
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_30
    const-string/jumbo v0, "android.gov.nist.javax.sip.NIO_MAX_SOCKET_IDLE_TIME"

    const-string v1, "7200000"

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1510
    .local v1, "maxIdleTimeString":Ljava/lang/String;
    move-object/from16 v45, v4

    .end local v4    # "messageProcessorFactoryName":Ljava/lang/String;
    .local v45, "messageProcessorFactoryName":Ljava/lang/String;
    :try_start_22
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioSocketMaxIdleTime:J
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_1c

    .line 1515
    move-object/from16 v46, v2

    goto :goto_31

    .line 1511
    :catch_1c
    move-exception v0

    .line 1512
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v46, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .local v46, "in":Ljava/io/InputStream;
    const-string v2, "Bad configuration value for android.gov.nist.javax.sip.NIO_MAX_SOCKET_IDLE_TIME="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1517
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_31
    const-string/jumbo v0, "android.gov.nist.javax.sip.NIO_BLOCKING_MODE"

    const-string v2, "BLOCKING"

    invoke-virtual {v12, v0, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1519
    .local v2, "nioMode":Ljava/lang/String;
    :try_start_23
    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/NIOMode;->valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/NIOMode;

    move-result-object v0

    iput-object v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->nioMode:Landroid/gov/nist/javax/sip/stack/NIOMode;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_1d

    .line 1524
    move-object/from16 v47, v1

    goto :goto_32

    .line 1520
    :catch_1d
    move-exception v0

    .line 1521
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v4, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v47, v1

    .end local v1    # "maxIdleTimeString":Ljava/lang/String;
    .local v47, "maxIdleTimeString":Ljava/lang/String;
    const-string v1, "Bad configuration value for android.gov.nist.javax.sip.NIO_BLOCKING_MODE="

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v1, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1528
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_32
    const-class v0, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "android.gov.nist.javax.sip.TIMER_CLASS_NAME"

    invoke-virtual {v12, v1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1530
    .local v1, "defaultTimerName":Ljava/lang/String;
    :try_start_24
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    invoke-virtual {v9, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->setTimer(Landroid/gov/nist/javax/sip/stack/timers/SipTimer;)V

    .line 1531
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    invoke-interface {v0, v9, v12}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->start(Landroid/gov/nist/javax/sip/SipStackImpl;Ljava/util/Properties;)V

    .line 1532
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v0

    if-eqz v0, :cond_3d

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/gov/nist/core/ThreadAuditor;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 1534
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v0

    new-instance v4, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;

    const/4 v5, 0x0

    invoke-direct {v4, v9, v5}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_1f

    move-object/from16 v48, v1

    move-object v5, v2

    .end local v1    # "defaultTimerName":Ljava/lang/String;
    .end local v2    # "nioMode":Ljava/lang/String;
    .local v5, "nioMode":Ljava/lang/String;
    .local v48, "defaultTimerName":Ljava/lang/String;
    const-wide/16 v1, 0x0

    :try_start_25
    invoke-interface {v0, v4, v1, v2}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_1e

    goto :goto_33

    .line 1536
    :catch_1e
    move-exception v0

    goto :goto_34

    .line 1532
    .end local v5    # "nioMode":Ljava/lang/String;
    .end local v48    # "defaultTimerName":Ljava/lang/String;
    .restart local v1    # "defaultTimerName":Ljava/lang/String;
    .restart local v2    # "nioMode":Ljava/lang/String;
    :cond_3d
    move-object/from16 v48, v1

    move-object v5, v2

    .line 1540
    .end local v1    # "defaultTimerName":Ljava/lang/String;
    .end local v2    # "nioMode":Ljava/lang/String;
    .restart local v5    # "nioMode":Ljava/lang/String;
    .restart local v48    # "defaultTimerName":Ljava/lang/String;
    :goto_33
    goto :goto_35

    .line 1536
    .end local v5    # "nioMode":Ljava/lang/String;
    .end local v48    # "defaultTimerName":Ljava/lang/String;
    .restart local v1    # "defaultTimerName":Ljava/lang/String;
    .restart local v2    # "nioMode":Ljava/lang/String;
    :catch_1f
    move-exception v0

    move-object/from16 v48, v1

    move-object v5, v2

    .line 1537
    .end local v1    # "defaultTimerName":Ljava/lang/String;
    .end local v2    # "nioMode":Ljava/lang/String;
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v5    # "nioMode":Ljava/lang/String;
    .restart local v48    # "defaultTimerName":Ljava/lang/String;
    :goto_34
    sget-object v1, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Bad configuration value for android.gov.nist.javax.sip.TIMER_CLASS_NAME"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1541
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_35
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "android.gov.nist.javax.sip.AGGRESSIVE_CLEANUP"

    invoke-virtual {v12, v1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 1544
    .local v1, "aggressiveCleanup":Z
    if-eqz v1, :cond_3e

    .line 1545
    sget-object v0, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->Normal:Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    invoke-virtual {v9, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->setReleaseReferencesStrategy(Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;)V

    .line 1548
    :cond_3e
    const-string/jumbo v0, "android.gov.nist.javax.sip.RELEASE_REFERENCES_STRATEGY"

    invoke-virtual {v12, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1550
    .local v2, "releaseReferencesStrategyString":Ljava/lang/String;
    if-eqz v2, :cond_40

    .line 1551
    invoke-static {v2}, Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;->valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->setReleaseReferencesStrategy(Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;)V

    .line 1552
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v0, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 1553
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v39, v1

    .end local v1    # "aggressiveCleanup":Z
    .local v39, "aggressiveCleanup":Z
    const-string/jumbo v1, "Using following release references strategy "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_36

    .line 1552
    .end local v39    # "aggressiveCleanup":Z
    .restart local v1    # "aggressiveCleanup":Z
    :cond_3f
    move/from16 v39, v1

    .end local v1    # "aggressiveCleanup":Z
    .restart local v39    # "aggressiveCleanup":Z
    goto :goto_36

    .line 1550
    .end local v39    # "aggressiveCleanup":Z
    .restart local v1    # "aggressiveCleanup":Z
    :cond_40
    move/from16 v39, v1

    .line 1556
    .end local v1    # "aggressiveCleanup":Z
    .restart local v39    # "aggressiveCleanup":Z
    :goto_36
    const-string/jumbo v0, "android.gov.nist.javax.sip.SIP_MESSAGE_VALVE"

    const/4 v1, 0x0

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1557
    .local v4, "valveClassName":Ljava/lang/String;
    if-eqz v4, :cond_42

    const-string v0, ""

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    .line 1558
    const-string v0, ","

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1559
    .local v1, "valves":[Ljava/lang/String;
    move-object/from16 v49, v1

    move-object/from16 v50, v1

    move-object/from16 v49, v2

    .end local v2    # "releaseReferencesStrategyString":Ljava/lang/String;
    .local v1, "arr$":[Ljava/lang/String;
    .local v49, "releaseReferencesStrategyString":Ljava/lang/String;
    .local v50, "valves":[Ljava/lang/String;
    array-length v2, v1

    .local v2, "len$":I
    const/4 v0, 0x0

    move-object/from16 v51, v4

    move v4, v0

    .local v4, "i$":I
    .local v51, "valveClassName":Ljava/lang/String;
    :goto_37
    if-ge v4, v2, :cond_41

    aget-object v52, v1, v4

    .line 1561
    .local v52, "valve":Ljava/lang/String;
    :try_start_26
    invoke-static/range {v52 .. v52}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_24

    move-object/from16 v53, v0

    .line 1562
    .local v53, "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    move-object/from16 v54, p0

    .line 1565
    .local v54, "thisStack":Landroid/javax/sip/SipStack;
    const-wide/16 v55, 0x64

    :try_start_27
    invoke-static/range {v55 .. v56}, Ljava/lang/Thread;->sleep(J)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_21

    .line 1566
    move-object/from16 v55, v1

    move-object/from16 v1, v53

    move/from16 v53, v2

    move-object/from16 v2, v54

    .end local v54    # "thisStack":Landroid/javax/sip/SipStack;
    .local v1, "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    .local v2, "thisStack":Landroid/javax/sip/SipStack;
    .local v53, "len$":I
    .local v55, "arr$":[Ljava/lang/String;
    :try_start_28
    invoke-interface {v1, v2}, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;->init(Landroid/javax/sip/SipStack;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_20

    .line 1570
    move-object/from16 v54, v2

    move-object/from16 v56, v5

    goto :goto_39

    .line 1567
    :catch_20
    move-exception v0

    goto :goto_38

    .end local v55    # "arr$":[Ljava/lang/String;
    .local v1, "arr$":[Ljava/lang/String;
    .local v2, "len$":I
    .local v53, "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    .restart local v54    # "thisStack":Landroid/javax/sip/SipStack;
    :catch_21
    move-exception v0

    move-object/from16 v55, v1

    move-object/from16 v1, v53

    move/from16 v53, v2

    move-object/from16 v2, v54

    .line 1568
    .end local v54    # "thisStack":Landroid/javax/sip/SipStack;
    .restart local v0    # "e":Ljava/lang/Exception;
    .local v1, "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    .local v2, "thisStack":Landroid/javax/sip/SipStack;
    .local v53, "len$":I
    .restart local v55    # "arr$":[Ljava/lang/String;
    :goto_38
    move-object/from16 v54, v2

    .end local v2    # "thisStack":Landroid/javax/sip/SipStack;
    .restart local v54    # "thisStack":Landroid/javax/sip/SipStack;
    :try_start_29
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_23

    move-object/from16 v56, v5

    .end local v5    # "nioMode":Ljava/lang/String;
    .local v56, "nioMode":Ljava/lang/String;
    :try_start_2a
    const-string v5, "Error intializing SIPMessageValve"

    invoke-interface {v2, v5, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1571
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_39
    iget-object v0, v9, Landroid/gov/nist/javax/sip/SipStackImpl;->sipMessageValves:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_22

    .line 1576
    nop

    .end local v1    # "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    .end local v54    # "thisStack":Landroid/javax/sip/SipStack;
    goto :goto_3b

    .line 1572
    :catch_22
    move-exception v0

    goto :goto_3a

    .end local v56    # "nioMode":Ljava/lang/String;
    .restart local v5    # "nioMode":Ljava/lang/String;
    :catch_23
    move-exception v0

    move-object/from16 v56, v5

    .end local v5    # "nioMode":Ljava/lang/String;
    .restart local v56    # "nioMode":Ljava/lang/String;
    goto :goto_3a

    .end local v53    # "len$":I
    .end local v55    # "arr$":[Ljava/lang/String;
    .end local v56    # "nioMode":Ljava/lang/String;
    .local v1, "arr$":[Ljava/lang/String;
    .local v2, "len$":I
    .restart local v5    # "nioMode":Ljava/lang/String;
    :catch_24
    move-exception v0

    move-object/from16 v55, v1

    move/from16 v53, v2

    move-object/from16 v56, v5

    .line 1573
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "len$":I
    .end local v5    # "nioMode":Ljava/lang/String;
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v53    # "len$":I
    .restart local v55    # "arr$":[Ljava/lang/String;
    .restart local v56    # "nioMode":Ljava/lang/String;
    :goto_3a
    sget-object v1, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Bad configuration value for android.gov.nist.javax.sip.SIP_MESSAGE_VALVE"

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1559
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v52    # "valve":Ljava/lang/String;
    :goto_3b
    add-int/lit8 v4, v4, 0x1

    move/from16 v2, v53

    move-object/from16 v1, v55

    move-object/from16 v5, v56

    goto :goto_37

    .end local v53    # "len$":I
    .end local v55    # "arr$":[Ljava/lang/String;
    .end local v56    # "nioMode":Ljava/lang/String;
    .restart local v1    # "arr$":[Ljava/lang/String;
    .restart local v2    # "len$":I
    .restart local v5    # "nioMode":Ljava/lang/String;
    :cond_41
    move-object/from16 v55, v1

    move/from16 v53, v2

    move-object/from16 v56, v5

    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "len$":I
    .end local v5    # "nioMode":Ljava/lang/String;
    .restart local v53    # "len$":I
    .restart local v55    # "arr$":[Ljava/lang/String;
    .restart local v56    # "nioMode":Ljava/lang/String;
    goto :goto_3c

    .line 1557
    .end local v49    # "releaseReferencesStrategyString":Ljava/lang/String;
    .end local v50    # "valves":[Ljava/lang/String;
    .end local v51    # "valveClassName":Ljava/lang/String;
    .end local v53    # "len$":I
    .end local v55    # "arr$":[Ljava/lang/String;
    .end local v56    # "nioMode":Ljava/lang/String;
    .local v2, "releaseReferencesStrategyString":Ljava/lang/String;
    .local v4, "valveClassName":Ljava/lang/String;
    .restart local v5    # "nioMode":Ljava/lang/String;
    :cond_42
    move-object/from16 v49, v2

    move-object/from16 v51, v4

    move-object/from16 v56, v5

    .line 1580
    .end local v2    # "releaseReferencesStrategyString":Ljava/lang/String;
    .end local v4    # "valveClassName":Ljava/lang/String;
    .end local v5    # "nioMode":Ljava/lang/String;
    .restart local v49    # "releaseReferencesStrategyString":Ljava/lang/String;
    .restart local v51    # "valveClassName":Ljava/lang/String;
    .restart local v56    # "nioMode":Ljava/lang/String;
    :goto_3c
    const-string/jumbo v0, "android.gov.nist.javax.sip.SIP_EVENT_INTERCEPTOR"

    const/4 v1, 0x0

    invoke-virtual {v12, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1581
    .local v1, "interceptorClassName":Ljava/lang/String;
    if-eqz v1, :cond_43

    const-string v0, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_43

    .line 1583
    :try_start_2b
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    iput-object v0, v9, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    .line 1584
    move-object/from16 v0, p0

    .line 1585
    .local v0, "thisStack":Landroid/javax/sip/SipStack;
    new-instance v2, Landroid/gov/nist/javax/sip/SipStackImpl$1;

    invoke-direct {v2, v9, v0}, Landroid/gov/nist/javax/sip/SipStackImpl$1;-><init>(Landroid/gov/nist/javax/sip/SipStackImpl;Landroid/javax/sip/SipStack;)V

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/SipStackImpl$1;->start()V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_25

    .line 1601
    .end local v0    # "thisStack":Landroid/javax/sip/SipStack;
    goto :goto_3d

    .line 1597
    :catch_25
    move-exception v0

    .line 1598
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v4, "Bad configuration value for android.gov.nist.javax.sip.SIP_EVENT_INTERCEPTOR"

    invoke-interface {v2, v4, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1604
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_43
    :goto_3d
    const-string/jumbo v0, "android.gov.nist.javax.sip.SSL_RENEGOTIATION_ENABLED"

    invoke-virtual {v12, v0, v13}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 1608
    .local v0, "sslRenegotiationEnabled":Z
    invoke-virtual {v9, v0}, Landroid/gov/nist/javax/sip/SipStackImpl;->setSslRenegotiationEnabled(Z)V

    .line 1610
    return-void

    .line 1217
    .end local v0    # "sslRenegotiationEnabled":Z
    .end local v1    # "interceptorClassName":Ljava/lang/String;
    .end local v11    # "readTimeout":Ljava/lang/String;
    .end local v14    # "cacheflag":Ljava/lang/String;
    .end local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .end local v22    # "stunAddr":Ljava/lang/String;
    .end local v30    # "bufferSizeInteger":I
    .end local v31    # "messageLogFactoryClasspath":Ljava/lang/String;
    .end local v33    # "flag":Ljava/lang/String;
    .end local v34    # "connTimeout":Ljava/lang/String;
    .end local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .end local v36    # "maxMsgSize":Ljava/lang/String;
    .end local v37    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .end local v38    # "rel":Ljava/lang/String;
    .end local v39    # "aggressiveCleanup":Z
    .end local v40    # "interval":Ljava/lang/String;
    .end local v41    # "computeContentLength":Z
    .end local v42    # "tlsClientProtocols":Ljava/lang/String;
    .end local v43    # "cipherSuitesStr":Ljava/lang/String;
    .end local v44    # "messageParserFactoryName":Ljava/lang/String;
    .end local v45    # "messageProcessorFactoryName":Ljava/lang/String;
    .end local v46    # "in":Ljava/io/InputStream;
    .end local v47    # "maxIdleTimeString":Ljava/lang/String;
    .end local v48    # "defaultTimerName":Ljava/lang/String;
    .end local v49    # "releaseReferencesStrategyString":Ljava/lang/String;
    .end local v51    # "valveClassName":Ljava/lang/String;
    .end local v56    # "nioMode":Ljava/lang/String;
    .local v4, "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .local v5, "NETWORK_LAYER_KEY":Ljava/lang/String;
    .local v6, "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    :catch_26
    move-exception v0

    move-object/from16 v35, v4

    move-object/from16 v37, v5

    move-object/from16 v20, v6

    .line 1218
    .end local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .end local v5    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .end local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .local v0, "ex":Ljava/io/IOException;
    .restart local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .restart local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v37    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    const-string v2, "Cannot initialize security manager provider"

    invoke-direct {v1, v2, v0}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1215
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .end local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .end local v37    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .restart local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v5    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .restart local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    :catch_27
    move-exception v0

    move-object/from16 v35, v4

    move-object/from16 v37, v5

    move-object/from16 v20, v6

    .line 1216
    .end local v4    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .end local v5    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .end local v6    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .local v0, "ex":Ljava/security/GeneralSecurityException;
    .restart local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .restart local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .restart local v37    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    const-string v2, "Cannot initialize security manager provider"

    invoke-direct {v1, v2, v0}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1061
    .end local v0    # "ex":Ljava/security/GeneralSecurityException;
    .end local v7    # "maxConnections":Ljava/lang/String;
    .end local v8    # "threadPoolSize":Ljava/lang/String;
    .end local v10    # "tcpTreadPoolSize":Ljava/lang/String;
    .end local v20    # "ADDRESS_RESOLVER_KEY":Ljava/lang/String;
    .end local v21    # "forkedSubscriptions":Ljava/lang/String;
    .end local v24    # "serverTransactionTableSize":Ljava/lang/String;
    .end local v25    # "congetstionControlTimeout":I
    .end local v32    # "clientTransactionTableSize":Ljava/lang/String;
    .end local v35    # "SECURITY_MANAGER_PROVIDER_KEY":Ljava/lang/String;
    .end local v37    # "NETWORK_LAYER_KEY":Ljava/lang/String;
    .local v2, "forkedSubscriptions":Ljava/lang/String;
    :catch_28
    move-exception v0

    move-object/from16 v21, v2

    .line 1062
    .end local v2    # "forkedSubscriptions":Ljava/lang/String;
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v21    # "forkedSubscriptions":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1057
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v21    # "forkedSubscriptions":Ljava/lang/String;
    .restart local v2    # "forkedSubscriptions":Ljava/lang/String;
    :catch_29
    move-exception v0

    move-object/from16 v21, v2

    .line 1058
    .end local v2    # "forkedSubscriptions":Ljava/lang/String;
    .local v0, "ex1":Ljava/lang/reflect/InvocationTargetException;
    .restart local v21    # "forkedSubscriptions":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 895
    .end local v0    # "ex1":Ljava/lang/reflect/InvocationTargetException;
    .end local v3    # "tlsPolicyPath":Ljava/lang/String;
    .end local v18    # "keyStoreFile":Ljava/lang/String;
    .end local v19    # "trustStoreFile":Ljava/lang/String;
    .end local v21    # "forkedSubscriptions":Ljava/lang/String;
    .end local v23    # "name":Ljava/lang/String;
    .end local v26    # "clientAuthType":Ljava/lang/String;
    .end local v27    # "extensionMethods":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .end local v29    # "useRouterForAll":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .local v14, "name":Ljava/lang/String;
    :catch_2a
    move-exception v0

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    .line 896
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    sget-object v1, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    check-cast v2, Ljava/lang/Exception;

    const-string/jumbo v3, "could not instantiate router"

    invoke-interface {v1, v3, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 898
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    const-string v2, "Could not instantiate router"

    invoke-direct {v1, v2, v0}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 888
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v23    # "name":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :catch_2b
    move-exception v0

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    .line 889
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .local v0, "ex1":Ljava/lang/reflect/InvocationTargetException;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    sget-object v1, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    check-cast v2, Ljava/lang/Exception;

    const-string/jumbo v3, "could not instantiate router -- invocation target problem"

    invoke-interface {v1, v3, v2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 893
    new-instance v1, Landroid/javax/sip/PeerUnavailableException;

    const-string v2, "Cound not instantiate router - check constructor"

    invoke-direct {v1, v2, v0}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 842
    .end local v0    # "ex1":Ljava/lang/reflect/InvocationTargetException;
    .end local v17    # "routerPath":Ljava/lang/String;
    .end local v23    # "name":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :catch_2c
    move-exception v0

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    .line 843
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 836
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v23    # "name":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :catch_2d
    move-exception v0

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    .line 837
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .local v0, "ex1":Ljava/lang/reflect/InvocationTargetException;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 813
    .end local v0    # "ex1":Ljava/lang/reflect/InvocationTargetException;
    .end local v16    # "serverLoggerClassName":Ljava/lang/String;
    .end local v23    # "name":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :catch_2e
    move-exception v0

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    .line 814
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 807
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v23    # "name":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :catch_2f
    move-exception v0

    move-object/from16 v28, v13

    move-object/from16 v23, v14

    .line 808
    .end local v13    # "address":Ljava/lang/String;
    .end local v14    # "name":Ljava/lang/String;
    .local v0, "ex1":Ljava/lang/reflect/InvocationTargetException;
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v28    # "address":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 791
    .end local v0    # "ex1":Ljava/lang/reflect/InvocationTargetException;
    .end local v15    # "stackLoggerClassName":Ljava/lang/String;
    .end local v23    # "name":Ljava/lang/String;
    .end local v28    # "address":Ljava/lang/String;
    .restart local v13    # "address":Ljava/lang/String;
    .restart local v14    # "name":Ljava/lang/String;
    :cond_44
    new-instance v0, Landroid/javax/sip/PeerUnavailableException;

    const-string/jumbo v1, "stack name is missing"

    invoke-direct {v0, v1}, Landroid/javax/sip/PeerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000()Landroid/gov/nist/core/StackLogger;
    .locals 1

    .line 652
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method

.method private reInitialize()V
    .locals 6

    .line 727
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->reInit()V

    .line 728
    new-instance v0, Landroid/gov/nist/javax/sip/EventScanner;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/EventScanner;-><init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    .line 729
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->listeningPoints:Ljava/util/Hashtable;

    .line 730
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipProviders:Ljava/util/List;

    .line 731
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipListener:Landroid/javax/sip/SipListener;

    .line 732
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->isStarted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 733
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->configurationProperties:Ljava/util/Properties;

    const-class v2, Landroid/gov/nist/javax/sip/stack/timers/DefaultSipTimer;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "android.gov.nist.javax.sip.TIMER_CLASS_NAME"

    invoke-virtual {v1, v3, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 735
    .local v1, "defaultTimerName":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/SipStackImpl;->setTimer(Landroid/gov/nist/javax/sip/stack/timers/SipTimer;)V

    .line 736
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->configurationProperties:Ljava/util/Properties;

    invoke-interface {v2, p0, v3}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->start(Landroid/gov/nist/javax/sip/SipStackImpl;Ljava/util/Properties;)V

    .line 737
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getThreadAuditor()Landroid/gov/nist/core/ThreadAuditor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/core/ThreadAuditor;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 739
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v2

    new-instance v3, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;

    invoke-direct {v3, p0, v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack$PingTimer;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/core/ThreadAuditor$ThreadHandle;)V

    const-wide/16 v4, 0x0

    invoke-interface {v2, v3, v4, v5}, Landroid/gov/nist/javax/sip/stack/timers/SipTimer;->schedule(Landroid/gov/nist/javax/sip/stack/SIPStackTimerTask;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 745
    :cond_0
    goto :goto_0

    .line 741
    :catch_0
    move-exception v0

    .line 742
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v3, "Bad configuration value for android.gov.nist.javax.sip.TIMER_CLASS_NAME"

    invoke-interface {v2, v3, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 747
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "defaultTimerName":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public acquireSem()Z
    .locals 4

    .line 2058
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->stackSemaphore:Ljava/util/concurrent/Semaphore;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 2059
    :catch_0
    move-exception v0

    .line 2060
    .local v0, "ex":Ljava/lang/InterruptedException;
    const/4 v1, 0x0

    return v1
.end method

.method public addLogAppender(Lorg/apache/log4j/Appender;)V
    .locals 1
    .param p1, "appender"    # Lorg/apache/log4j/Appender;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1912
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    instance-of v0, v0, Landroid/gov/nist/core/LogWriter;

    if-eqz v0, :cond_0

    .line 1913
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    check-cast v0, Landroid/gov/nist/core/LogWriter;

    invoke-virtual {v0, p1}, Landroid/gov/nist/core/LogWriter;->addAppender(Lorg/apache/log4j/Appender;)V

    .line 1915
    :cond_0
    return-void
.end method

.method public createListeningPoint(ILjava/lang/String;)Landroid/javax/sip/ListeningPoint;
    .locals 2
    .param p1, "port"    # I
    .param p2, "transport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransportNotSupportedException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    .line 1820
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackAddress:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1823
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->stackAddress:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, p2}, Landroid/gov/nist/javax/sip/SipStackImpl;->createListeningPoint(Ljava/lang/String;ILjava/lang/String;)Landroid/javax/sip/ListeningPoint;

    move-result-object v0

    return-object v0

    .line 1821
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Stack does not have a default IP Address!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized createListeningPoint(Ljava/lang/String;ILjava/lang/String;)Landroid/javax/sip/ListeningPoint;
    .locals 7
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "transport"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/TransportNotSupportedException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation

    monitor-enter p0

    .line 1621
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1622
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "createListeningPoint : address = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " port = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " transport = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1626
    .end local p0    # "this":Landroid/gov/nist/javax/sip/SipStackImpl;
    :cond_0
    if-eqz p1, :cond_9

    .line 1629
    if-eqz p3, :cond_8

    .line 1631
    if-lez p2, :cond_7

    .line 1634
    const-string/jumbo v0, "UDP"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "TLS"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "TCP"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "SCTP"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "WS"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "WSS"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1640
    :cond_1
    new-instance v0, Landroid/javax/sip/TransportNotSupportedException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad transport "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/javax/sip/TransportNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1644
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->isAlive()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1645
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->toExit:Z

    .line 1646
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->reInitialize()V

    .line 1649
    :cond_3
    invoke-static {p1, p2, p3}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->makeKey(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1651
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->listeningPoints:Ljava/util/Hashtable;

    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gov/nist/javax/sip/ListeningPointImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1652
    .local v2, "lip":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    if-eqz v2, :cond_4

    .line 1653
    monitor-exit p0

    return-object v2

    .line 1656
    :cond_4
    :try_start_1
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    .line 1657
    .local v3, "inetAddr":Ljava/net/InetAddress;
    invoke-virtual {p0, v3, p2, p3}, Landroid/gov/nist/javax/sip/SipStackImpl;->createMessageProcessor(Ljava/net/InetAddress;ILjava/lang/String;)Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    move-result-object v4

    .line 1659
    .local v4, "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    sget-object v5, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1660
    sget-object v1, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Created Message Processor: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " port = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " transport = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1665
    :cond_5
    new-instance v1, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    invoke-direct {v1, p0, p2, p3}, Landroid/gov/nist/javax/sip/ListeningPointImpl;-><init>(Landroid/javax/sip/SipStack;ILjava/lang/String;)V

    move-object v2, v1

    .line 1666
    iput-object v4, v2, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    .line 1667
    invoke-virtual {v4, v2}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->setListeningPoint(Landroid/gov/nist/javax/sip/ListeningPointImpl;)V

    .line 1668
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->listeningPoints:Ljava/util/Hashtable;

    invoke-virtual {v1, v0, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1670
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/stack/MessageProcessor;->start()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1671
    monitor-exit p0

    return-object v2

    .line 1672
    .end local v3    # "inetAddr":Ljava/net/InetAddress;
    .end local v4    # "messageProcessor":Landroid/gov/nist/javax/sip/stack/MessageProcessor;
    :catch_0
    move-exception v1

    .line 1673
    .local v1, "ex":Ljava/io/IOException;
    :try_start_2
    sget-object v3, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1674
    sget-object v3, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid argument address = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " port = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " transport = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 1677
    :cond_6
    new-instance v3, Landroid/javax/sip/InvalidArgumentException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 1632
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v2    # "lip":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    :cond_7
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "bad port"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1630
    :cond_8
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null transport"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1627
    :cond_9
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Address for listening point is null!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1620
    .end local p1    # "address":Ljava/lang/String;
    .end local p2    # "port":I
    .end local p3    # "transport":Ljava/lang/String;
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public createSipProvider(Landroid/javax/sip/ListeningPoint;)Landroid/javax/sip/SipProvider;
    .locals 3
    .param p1, "listeningPoint"    # Landroid/javax/sip/ListeningPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation

    .line 1689
    if-eqz p1, :cond_2

    .line 1691
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1692
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "createSipProvider: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1694
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 1695
    .local v0, "listeningPointImpl":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    if-nez v1, :cond_1

    .line 1698
    new-instance v1, Landroid/gov/nist/javax/sip/SipProviderImpl;

    invoke-direct {v1, p0}, Landroid/gov/nist/javax/sip/SipProviderImpl;-><init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V

    .line 1700
    .local v1, "provider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->setListeningPoint(Landroid/javax/sip/ListeningPoint;)V

    .line 1701
    iput-object v1, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->sipProvider:Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 1702
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipProviders:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1703
    return-object v1

    .line 1696
    .end local v1    # "provider":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_1
    new-instance v1, Landroid/javax/sip/ObjectInUseException;

    const-string/jumbo v2, "Provider already attached!"

    invoke-direct {v1, v2}, Landroid/javax/sip/ObjectInUseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1690
    .end local v0    # "listeningPointImpl":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null listeningPoint"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public deleteListeningPoint(Landroid/javax/sip/ListeningPoint;)V
    .locals 3
    .param p1, "listeningPoint"    # Landroid/javax/sip/ListeningPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation

    .line 1713
    if-eqz p1, :cond_0

    .line 1715
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;

    .line 1717
    .local v0, "lip":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    iget-object v1, v0, Landroid/gov/nist/javax/sip/ListeningPointImpl;->messageProcessor:Landroid/gov/nist/javax/sip/stack/MessageProcessor;

    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->removeMessageProcessor(Landroid/gov/nist/javax/sip/stack/MessageProcessor;)V

    .line 1718
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/ListeningPointImpl;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 1719
    .local v1, "key":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->listeningPoints:Ljava/util/Hashtable;

    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1721
    return-void

    .line 1714
    .end local v0    # "lip":Landroid/gov/nist/javax/sip/ListeningPointImpl;
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null listeningPoint arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public deleteSipProvider(Landroid/javax/sip/SipProvider;)V
    .locals 3
    .param p1, "sipProvider"    # Landroid/javax/sip/SipProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ObjectInUseException;
        }
    .end annotation

    .line 1731
    if-eqz p1, :cond_2

    .line 1733
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/SipProviderImpl;

    .line 1739
    .local v0, "sipProviderImpl":Landroid/gov/nist/javax/sip/SipProviderImpl;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->getSipListener()Landroid/javax/sip/SipListener;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1744
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->removeListeningPoints()V

    .line 1747
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/SipProviderImpl;->stop()V

    .line 1748
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipProviders:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1749
    iget-object v1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipProviders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1750
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->stopStack()V

    .line 1752
    :cond_0
    return-void

    .line 1740
    :cond_1
    new-instance v1, Landroid/javax/sip/ObjectInUseException;

    const-string/jumbo v2, "SipProvider still has an associated SipListener!"

    invoke-direct {v1, v2}, Landroid/javax/sip/ObjectInUseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1732
    .end local v0    # "sipProviderImpl":Landroid/gov/nist/javax/sip/SipProviderImpl;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null provider arg"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected finalize()V
    .locals 0

    .line 1808
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->stopStack()V

    .line 1809
    return-void
.end method

.method public getAuthenticationHelper(Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;Landroid/javax/sip/header/HeaderFactory;)Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelper;
    .locals 1
    .param p1, "accountManager"    # Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;
    .param p2, "headerFactory"    # Landroid/javax/sip/header/HeaderFactory;

    .line 1945
    new-instance v0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;

    invoke-direct {v0, p0, p1, p2}, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;Landroid/javax/sip/header/HeaderFactory;)V

    return-object v0
.end method

.method public getConfigurationProperties()Ljava/util/Properties;
    .locals 1

    .line 2072
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->configurationProperties:Ljava/util/Properties;

    return-object v0
.end method

.method public getEnabledCipherSuites()[Ljava/lang/String;
    .locals 1

    .line 1990
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->cipherSuites:[Ljava/lang/String;

    return-object v0
.end method

.method public getEnabledProtocols()[Ljava/lang/String;
    .locals 1

    .line 2023
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->enabledProtocols:[Ljava/lang/String;

    return-object v0
.end method

.method public getEventScanner()Landroid/gov/nist/javax/sip/EventScanner;
    .locals 1

    .line 1933
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    return-object v0
.end method

.method public getIPAddress()Ljava/lang/String;
    .locals 1

    .line 1761
    invoke-super {p0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getListeningPoints()Ljava/util/Iterator;
    .locals 1

    .line 1770
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->listeningPoints:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getLogRecordFactory()Landroid/gov/nist/javax/sip/LogRecordFactory;
    .locals 1

    .line 1898
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logRecordFactory:Landroid/gov/nist/javax/sip/LogRecordFactory;

    return-object v0
.end method

.method public getLogger()Lorg/apache/log4j/Logger;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1926
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    instance-of v0, v0, Landroid/gov/nist/core/LogWriter;

    if-eqz v0, :cond_0

    .line 1927
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    check-cast v0, Landroid/gov/nist/core/LogWriter;

    invoke-virtual {v0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    return-object v0

    .line 1929
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSecureAuthenticationHelper(Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;Landroid/javax/sip/header/HeaderFactory;)Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelper;
    .locals 1
    .param p1, "accountManager"    # Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;
    .param p2, "headerFactory"    # Landroid/javax/sip/header/HeaderFactory;

    .line 1957
    new-instance v0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;

    invoke-direct {v0, p0, p1, p2}, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;-><init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;Landroid/javax/sip/header/HeaderFactory;)V

    return-object v0
.end method

.method public getSipListener()Landroid/javax/sip/SipListener;
    .locals 1

    .line 1879
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipListener:Landroid/javax/sip/SipListener;

    return-object v0
.end method

.method public getSipProviders()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/gov/nist/javax/sip/SipProviderImpl;",
            ">;"
        }
    .end annotation

    .line 1789
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipProviders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getStackName()Ljava/lang/String;
    .locals 1

    .line 1798
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->stackName:Ljava/lang/String;

    return-object v0
.end method

.method public getTlsSecurityPolicy()Landroid/gov/nist/javax/sip/TlsSecurityPolicy;
    .locals 1

    .line 1889
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->tlsSecurityPolicy:Landroid/gov/nist/javax/sip/TlsSecurityPolicy;

    return-object v0
.end method

.method public isAutomaticDialogErrorHandlingEnabled()Z
    .locals 1

    .line 2048
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogErrorHandlingEnabled:Z

    return v0
.end method

.method isAutomaticDialogSupportEnabled()Z
    .locals 1

    .line 756
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isAutomaticDialogSupportEnabled:Z

    return v0
.end method

.method public isBackToBackUserAgent()Z
    .locals 1

    .line 2044
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isBackToBackUserAgent:Z

    return v0
.end method

.method public isReEntrantListener()Z
    .locals 1

    .line 2079
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->reEntrantListener:Z

    return v0
.end method

.method public isRetransmissionFilterActive()Z
    .locals 1

    .line 1780
    const/4 v0, 0x1

    return v0
.end method

.method public releaseSem()V
    .locals 1

    .line 2065
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->stackSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 2066
    return-void
.end method

.method public setEnabledCipherSuites([Ljava/lang/String;)V
    .locals 0
    .param p1, "newCipherSuites"    # [Ljava/lang/String;

    .line 1981
    iput-object p1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->cipherSuites:[Ljava/lang/String;

    .line 1982
    return-void
.end method

.method public setEnabledProtocols([Ljava/lang/String;)V
    .locals 0
    .param p1, "newProtocols"    # [Ljava/lang/String;

    .line 2014
    iput-object p1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->enabledProtocols:[Ljava/lang/String;

    .line 2015
    return-void
.end method

.method public setIsBackToBackUserAgent(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 2034
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isBackToBackUserAgent:Z

    .line 2035
    return-void
.end method

.method public setTlsSecurityPolicy(Landroid/gov/nist/javax/sip/TlsSecurityPolicy;)V
    .locals 0
    .param p1, "tlsSecurityPolicy"    # Landroid/gov/nist/javax/sip/TlsSecurityPolicy;

    .line 2053
    iput-object p1, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->tlsSecurityPolicy:Landroid/gov/nist/javax/sip/TlsSecurityPolicy;

    .line 2054
    return-void
.end method

.method public start()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/ProviderDoesNotExistException;,
            Landroid/javax/sip/SipException;
        }
    .end annotation

    .line 1864
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    if-nez v0, :cond_0

    .line 1865
    new-instance v0, Landroid/gov/nist/javax/sip/EventScanner;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sip/EventScanner;-><init>(Landroid/gov/nist/javax/sip/SipStackImpl;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    .line 1868
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1832
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1833
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v1, "stopStack -- stoppping the stack"

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 1834
    sget-object v0, Landroid/gov/nist/javax/sip/SipStackImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 1836
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/SipStackImpl;->stopStack()V

    .line 1837
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 1838
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipMessageValves:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;

    .line 1839
    .local v1, "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/stack/SIPMessageValve;->destroy()V

    .line 1840
    .end local v1    # "sipMessageValve":Landroid/gov/nist/javax/sip/stack/SIPMessageValve;
    goto :goto_0

    .line 1842
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    if-eqz v0, :cond_2

    .line 1843
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->sipEventInterceptor:Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPEventInterceptor;->destroy()V

    .line 1844
    :cond_2
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->sipProviders:Ljava/util/List;

    .line 1845
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->listeningPoints:Ljava/util/Hashtable;

    .line 1850
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    if-eqz v0, :cond_3

    .line 1851
    iget-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/EventScanner;->forceStop()V

    .line 1852
    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/SipStackImpl;->eventScanner:Landroid/gov/nist/javax/sip/EventScanner;

    .line 1853
    invoke-static {}, Landroid/gov/nist/javax/sip/parser/PostParseExecutorServices;->shutdownThreadpool()V

    .line 1855
    return-void
.end method
