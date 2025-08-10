.class public Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;
.super Ljava/lang/Object;
.source "DefaultSecurityManagerProvider.java"

# interfaces
.implements Landroid/gov/nist/core/net/SecurityManagerProvider;


# static fields
.field private static final logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private keyManagerFactory:Ljavax/net/ssl/KeyManagerFactory;

.field private trustManagerFactory:Ljavax/net/ssl/TrustManagerFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;
    .locals 1
    .param p1, "client"    # Z

    .line 110
    iget-object v0, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->keyManagerFactory:Ljavax/net/ssl/KeyManagerFactory;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 111
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->keyManagerFactory:Ljavax/net/ssl/KeyManagerFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object v0

    return-object v0
.end method

.method public getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;
    .locals 1
    .param p1, "client"    # Z

    .line 115
    iget-object v0, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->trustManagerFactory:Ljavax/net/ssl/TrustManagerFactory;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 116
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->trustManagerFactory:Ljavax/net/ssl/TrustManagerFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    return-object v0
.end method

.method public init(Ljava/util/Properties;)V
    .locals 12
    .param p1, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    const-string/jumbo v0, "javax.net.ssl.keyStore"

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "keyStoreFilename":Ljava/lang/String;
    const-string/jumbo v1, "javax.net.ssl.keyStorePassword"

    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "keyStorePassword":Ljava/lang/String;
    const-string/jumbo v2, "javax.net.ssl.keyStoreType"

    invoke-virtual {p1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 45
    .local v2, "keyStoreType":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 46
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v2

    .line 47
    sget-object v3, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Using default keystore type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 49
    :cond_0
    const-string v3, "***"

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    if-nez v1, :cond_3

    .line 50
    :cond_1
    sget-object v5, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "TLS server settings will be inactive - TLS key store will use JVM defaults keyStoreType="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " javax.net.ssl.keyStore="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " javax.net.ssl.keyStorePassword="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-nez v1, :cond_2

    move-object v7, v4

    goto :goto_0

    :cond_2
    move-object v7, v3

    :goto_0
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 57
    :cond_3
    const-string/jumbo v5, "javax.net.ssl.trustStore"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 59
    .local v5, "trustStoreFilename":Ljava/lang/String;
    const-string/jumbo v6, "javax.net.ssl.trustStorePassword"

    invoke-virtual {p1, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 60
    .local v6, "trustStorePassword":Ljava/lang/String;
    if-nez v6, :cond_4

    .line 61
    sget-object v7, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v8, "javax.net.ssl.trustStorePassword is null, using the password passed through javax.net.ssl.keyStorePassword"

    invoke-interface {v7, v8}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 62
    move-object v6, v1

    .line 65
    :cond_4
    const-string/jumbo v7, "javax.net.ssl.trustStoreType"

    invoke-virtual {p1, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 66
    .local v7, "trustStoreType":Ljava/lang/String;
    if-nez v7, :cond_5

    .line 67
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v7

    .line 68
    sget-object v8, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Using default truststore type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 70
    :cond_5
    if-eqz v5, :cond_6

    if-nez v6, :cond_8

    .line 71
    :cond_6
    sget-object v8, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "TLS trust settings will be inactive - TLS trust store will use JVM defaults. trustStoreType="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " javax.net.ssl.trustStore="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " javax.net.ssl.trustStorePassword="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-nez v6, :cond_7

    move-object v3, v4

    :cond_7
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v8, v3}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 77
    :cond_8
    const-string/jumbo v3, "ssl.KeyManagerFactory.algorithm"

    invoke-static {v3}, Ljava/security/Security;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, "algorithm":Ljava/lang/String;
    if-nez v3, :cond_9

    .line 79
    const-string/jumbo v3, "SunX509"

    .line 81
    :cond_9
    sget-object v8, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v9, 0x20

    invoke-interface {v8, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 82
    sget-object v8, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "SecurityManagerProvider "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " will use algorithm "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 85
    :cond_a
    invoke-static {v3}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v8

    iput-object v8, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->keyManagerFactory:Ljavax/net/ssl/KeyManagerFactory;

    .line 86
    if-eqz v0, :cond_b

    .line 87
    invoke-static {v2}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v8

    .line 88
    .local v8, "ks":Ljava/security/KeyStore;
    new-instance v10, Ljava/io/FileInputStream;

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v10, v11}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 90
    iget-object v10, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->keyManagerFactory:Ljavax/net/ssl/KeyManagerFactory;

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v11

    invoke-virtual {v10, v8, v11}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 91
    .end local v8    # "ks":Ljava/security/KeyStore;
    goto :goto_1

    .line 92
    :cond_b
    iget-object v8, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->keyManagerFactory:Ljavax/net/ssl/KeyManagerFactory;

    invoke-virtual {v8, v4, v4}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 95
    :goto_1
    invoke-static {v3}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v8

    iput-object v8, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->trustManagerFactory:Ljavax/net/ssl/TrustManagerFactory;

    .line 96
    if-eqz v5, :cond_c

    .line 97
    invoke-static {v7}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v4

    .line 98
    .local v4, "ts":Ljava/security/KeyStore;
    new-instance v8, Ljava/io/FileInputStream;

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v6}, Ljava/lang/String;->toCharArray()[C

    move-result-object v10

    invoke-virtual {v4, v8, v10}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 100
    iget-object v8, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->trustManagerFactory:Ljavax/net/ssl/TrustManagerFactory;

    invoke-virtual {v8, v4}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 101
    .end local v4    # "ts":Ljava/security/KeyStore;
    goto :goto_2

    .line 102
    :cond_c
    iget-object v8, p0, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->trustManagerFactory:Ljavax/net/ssl/TrustManagerFactory;

    move-object v10, v4

    check-cast v10, Ljava/security/KeyStore;

    invoke-virtual {v8, v4}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 104
    :goto_2
    sget-object v4, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v4, v9}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 105
    sget-object v4, Landroid/gov/nist/core/net/DefaultSecurityManagerProvider;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "TLS settings OK. SecurityManagerProvider "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " initialized."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v8}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 107
    :cond_d
    return-void
.end method
