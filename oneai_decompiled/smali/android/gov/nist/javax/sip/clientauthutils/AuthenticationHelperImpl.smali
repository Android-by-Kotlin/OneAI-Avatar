.class public Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;
.super Ljava/lang/Object;
.source "AuthenticationHelperImpl.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelper;


# static fields
.field private static logger:Landroid/gov/nist/core/StackLogger;


# instance fields
.field private accountManager:Ljava/lang/Object;

.field private cachedCredentials:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

.field private headerFactory:Landroid/javax/sip/header/HeaderFactory;

.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field timer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 67
    const-class v0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;Landroid/javax/sip/header/HeaderFactory;)V
    .locals 2
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "accountManager"    # Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;
    .param p3, "headerFactory"    # Landroid/javax/sip/header/HeaderFactory;

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->accountManager:Ljava/lang/Object;

    .line 97
    iput-object p2, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->accountManager:Ljava/lang/Object;

    .line 98
    iput-object p3, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    .line 99
    iput-object p1, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 101
    new-instance v0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;-><init>(Landroid/gov/nist/javax/sip/stack/timers/SipTimer;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->cachedCredentials:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    .line 102
    return-void
.end method

.method public constructor <init>(Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;Landroid/javax/sip/header/HeaderFactory;)V
    .locals 2
    .param p1, "sipStack"    # Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;
    .param p2, "accountManager"    # Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;
    .param p3, "headerFactory"    # Landroid/javax/sip/header/HeaderFactory;

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->accountManager:Ljava/lang/Object;

    .line 114
    iput-object p2, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->accountManager:Ljava/lang/Object;

    .line 115
    iput-object p3, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    .line 116
    iput-object p1, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 118
    new-instance v0, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getTimer()Landroid/gov/nist/javax/sip/stack/timers/SipTimer;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;-><init>(Landroid/gov/nist/javax/sip/stack/timers/SipTimer;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->cachedCredentials:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    .line 119
    return-void
.end method

.method private getAuthorization(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/javax/sip/header/WWWAuthenticateHeader;Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;)Landroid/javax/sip/header/AuthorizationHeader;
    .locals 16
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "requestBody"    # Ljava/lang/String;
    .param p4, "authHeader"    # Landroid/javax/sip/header/WWWAuthenticateHeader;
    .param p5, "userCredentials"    # Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;

    .line 387
    move-object/from16 v1, p0

    const/4 v0, 0x0

    .line 391
    .local v0, "response":Ljava/lang/String;
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getQop()Ljava/lang/String;

    move-result-object v2

    .line 392
    .local v2, "qopList":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string/jumbo v3, "auth"

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 393
    .local v3, "qop":Ljava/lang/String;
    :goto_0
    const-string v14, "00000001"

    .line 394
    .local v14, "nc_value":Ljava/lang/String;
    const-string/jumbo v15, "xyz"

    .line 396
    .local v15, "cnonce":Ljava/lang/String;
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getAlgorithm()Ljava/lang/String;

    move-result-object v4

    invoke-interface/range {p5 .. p5}, Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;->getHashUserDomainPassword()Ljava/lang/String;

    move-result-object v5

    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getNonce()Ljava/lang/String;

    move-result-object v6

    sget-object v13, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move-object v7, v14

    move-object v8, v15

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move-object/from16 v11, p3

    move-object v12, v3

    invoke-static/range {v4 .. v13}, Landroid/gov/nist/javax/sip/clientauthutils/MessageDigestAlgorithm;->calculateResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/gov/nist/core/StackLogger;)Ljava/lang/String;

    move-result-object v4

    .line 401
    .end local v0    # "response":Ljava/lang/String;
    .local v4, "response":Ljava/lang/String;
    const/4 v5, 0x0

    .line 403
    .local v5, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    move-object/from16 v6, p4

    :try_start_0
    instance-of v0, v6, Landroid/javax/sip/header/ProxyAuthenticateHeader;

    if-eqz v0, :cond_1

    .line 404
    iget-object v0, v1, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Landroid/javax/sip/header/HeaderFactory;->createProxyAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyAuthorizationHeader;

    move-result-object v0

    move-object v5, v0

    .end local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .local v0, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    goto :goto_1

    .line 407
    .end local v0    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .restart local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    :cond_1
    iget-object v0, v1, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Landroid/javax/sip/header/HeaderFactory;->createAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/AuthorizationHeader;

    move-result-object v0

    .end local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .restart local v0    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    move-object v5, v0

    .line 410
    .end local v0    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .restart local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    :goto_1
    invoke-interface/range {p5 .. p5}, Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;->getUserName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setUsername(Ljava/lang/String;)V

    .line 411
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getRealm()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setRealm(Ljava/lang/String;)V

    .line 412
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getNonce()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setNonce(Ljava/lang/String;)V

    .line 413
    const-string/jumbo v0, "uri"
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v7, p2

    :try_start_1
    invoke-interface {v5, v0, v7}, Landroid/javax/sip/header/AuthorizationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    invoke-interface {v5, v4}, Landroid/javax/sip/header/AuthorizationHeader;->setResponse(Ljava/lang/String;)V

    .line 415
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 416
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setAlgorithm(Ljava/lang/String;)V

    .line 419
    :cond_2
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getOpaque()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 420
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getOpaque()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setOpaque(Ljava/lang/String;)V

    .line 424
    :cond_3
    if-eqz v3, :cond_4

    .line 425
    invoke-interface {v5, v3}, Landroid/javax/sip/header/AuthorizationHeader;->setQop(Ljava/lang/String;)V

    .line 426
    invoke-interface {v5, v15}, Landroid/javax/sip/header/AuthorizationHeader;->setCNonce(Ljava/lang/String;)V

    .line 427
    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setNonceCount(I)V

    .line 430
    :cond_4
    invoke-interface {v5, v4}, Landroid/javax/sip/header/AuthorizationHeader;->setResponse(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    .line 434
    nop

    .line 436
    return-object v5

    .line 432
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object/from16 v7, p2

    .line 433
    .local v0, "ex":Ljava/text/ParseException;
    :goto_2
    new-instance v8, Ljava/lang/RuntimeException;

    const-string v9, "Failed to create an authorization header!"

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method private getAuthorization(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/javax/sip/header/WWWAuthenticateHeader;Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;)Landroid/javax/sip/header/AuthorizationHeader;
    .locals 19
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "requestBody"    # Ljava/lang/String;
    .param p4, "authHeader"    # Landroid/javax/sip/header/WWWAuthenticateHeader;
    .param p5, "userCredentials"    # Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;

    .line 320
    move-object/from16 v1, p0

    const/4 v0, 0x0

    .line 324
    .local v0, "response":Ljava/lang/String;
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getQop()Ljava/lang/String;

    move-result-object v2

    .line 325
    .local v2, "qopList":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string/jumbo v3, "auth"

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 326
    .local v3, "qop":Ljava/lang/String;
    :goto_0
    const-string v16, "00000001"

    .line 327
    .local v16, "nc_value":Ljava/lang/String;
    const-string/jumbo v15, "xyz"

    .line 329
    .local v15, "cnonce":Ljava/lang/String;
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getAlgorithm()Ljava/lang/String;

    move-result-object v4

    invoke-interface/range {p5 .. p5}, Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;->getUserName()Ljava/lang/String;

    move-result-object v5

    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getRealm()Ljava/lang/String;

    move-result-object v6

    invoke-interface/range {p5 .. p5}, Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;->getPassword()Ljava/lang/String;

    move-result-object v7

    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getNonce()Ljava/lang/String;

    move-result-object v8

    sget-object v17, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v9, v16

    move-object v10, v15

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object v14, v3

    move-object/from16 v18, v2

    move-object v2, v15

    .end local v15    # "cnonce":Ljava/lang/String;
    .local v2, "cnonce":Ljava/lang/String;
    .local v18, "qopList":Ljava/lang/String;
    move-object/from16 v15, v17

    invoke-static/range {v4 .. v15}, Landroid/gov/nist/javax/sip/clientauthutils/MessageDigestAlgorithm;->calculateResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/gov/nist/core/StackLogger;)Ljava/lang/String;

    move-result-object v4

    .line 335
    .end local v0    # "response":Ljava/lang/String;
    .local v4, "response":Ljava/lang/String;
    const/4 v5, 0x0

    .line 337
    .local v5, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    move-object/from16 v6, p4

    :try_start_0
    instance-of v0, v6, Landroid/javax/sip/header/ProxyAuthenticateHeader;

    if-eqz v0, :cond_1

    .line 338
    iget-object v0, v1, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Landroid/javax/sip/header/HeaderFactory;->createProxyAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyAuthorizationHeader;

    move-result-object v0

    move-object v5, v0

    .end local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .local v0, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    goto :goto_1

    .line 341
    .end local v0    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .restart local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    :cond_1
    iget-object v0, v1, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->headerFactory:Landroid/javax/sip/header/HeaderFactory;

    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Landroid/javax/sip/header/HeaderFactory;->createAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/AuthorizationHeader;

    move-result-object v0

    .end local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .restart local v0    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    move-object v5, v0

    .line 344
    .end local v0    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .restart local v5    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    :goto_1
    invoke-interface/range {p5 .. p5}, Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;->getUserName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setUsername(Ljava/lang/String;)V

    .line 345
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getRealm()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setRealm(Ljava/lang/String;)V

    .line 346
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getNonce()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setNonce(Ljava/lang/String;)V

    .line 347
    const-string/jumbo v0, "uri"
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v7, p2

    :try_start_1
    invoke-interface {v5, v0, v7}, Landroid/javax/sip/header/AuthorizationHeader;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    invoke-interface {v5, v4}, Landroid/javax/sip/header/AuthorizationHeader;->setResponse(Ljava/lang/String;)V

    .line 349
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 350
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setAlgorithm(Ljava/lang/String;)V

    .line 353
    :cond_2
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getOpaque()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 354
    invoke-interface/range {p4 .. p4}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getOpaque()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setOpaque(Ljava/lang/String;)V

    .line 358
    :cond_3
    if-eqz v3, :cond_4

    .line 359
    invoke-interface {v5, v3}, Landroid/javax/sip/header/AuthorizationHeader;->setQop(Ljava/lang/String;)V

    .line 360
    invoke-interface {v5, v2}, Landroid/javax/sip/header/AuthorizationHeader;->setCNonce(Ljava/lang/String;)V

    .line 361
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v5, v0}, Landroid/javax/sip/header/AuthorizationHeader;->setNonceCount(I)V

    .line 364
    :cond_4
    invoke-interface {v5, v4}, Landroid/javax/sip/header/AuthorizationHeader;->setResponse(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    .line 368
    nop

    .line 370
    return-object v5

    .line 366
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object/from16 v7, p2

    .line 367
    .local v0, "ex":Ljava/text/ParseException;
    :goto_2
    new-instance v8, Ljava/lang/RuntimeException;

    const-string v9, "Failed to create an authorization header!"

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method private removeBranchID(Landroid/javax/sip/message/Request;)V
    .locals 2
    .param p1, "request"    # Landroid/javax/sip/message/Request;

    .line 447
    const-string/jumbo v0, "Via"

    invoke-interface {p1, v0}, Landroid/javax/sip/message/Request;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/ViaHeader;

    .line 449
    .local v0, "viaHeader":Landroid/javax/sip/header/ViaHeader;
    const-string/jumbo v1, "branch"

    invoke-interface {v0, v1}, Landroid/javax/sip/header/ViaHeader;->removeParameter(Ljava/lang/String;)V

    .line 451
    return-void
.end method


# virtual methods
.method public handleChallenge(Landroid/javax/sip/message/Response;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/SipProvider;I)Landroid/javax/sip/ClientTransaction;
    .locals 6
    .param p1, "challenge"    # Landroid/javax/sip/message/Response;
    .param p2, "challengedTransaction"    # Landroid/javax/sip/ClientTransaction;
    .param p3, "transactionCreator"    # Landroid/javax/sip/SipProvider;
    .param p4, "cacheTime"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .line 131
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->handleChallenge(Landroid/javax/sip/message/Response;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/SipProvider;IZ)Landroid/javax/sip/ClientTransaction;

    move-result-object v0

    return-object v0
.end method

.method public handleChallenge(Landroid/javax/sip/message/Response;Landroid/javax/sip/ClientTransaction;Landroid/javax/sip/SipProvider;IZ)Landroid/javax/sip/ClientTransaction;
    .locals 23
    .param p1, "challenge"    # Landroid/javax/sip/message/Response;
    .param p2, "challengedTransaction"    # Landroid/javax/sip/ClientTransaction;
    .param p3, "transactionCreator"    # Landroid/javax/sip/SipProvider;
    .param p4, "cacheTime"    # I
    .param p5, "looseRouting"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/SipException;,
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .line 145
    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p2

    move/from16 v15, p4

    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v11, 0x20

    invoke-interface {v0, v11}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    sget-object v0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "handleChallenge: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 149
    :cond_0
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/ClientTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    move-object v10, v0

    .line 151
    .local v10, "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    const/4 v0, 0x0

    .line 157
    .local v0, "reoriginatedRequest":Landroid/javax/sip/message/Request;
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getToTag()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/ClientTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/ClientTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/Dialog;->getState()Landroid/javax/sip/DialogState;

    move-result-object v1

    sget-object v2, Landroid/javax/sip/DialogState;->CONFIRMED:Landroid/javax/sip/DialogState;

    if-eq v1, v2, :cond_1

    goto :goto_2

    .line 167
    :cond_1
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/ClientTransaction;->getDialog()Landroid/javax/sip/Dialog;

    move-result-object v1

    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/javax/sip/Dialog;->createRequest(Ljava/lang/String;)Landroid/javax/sip/message/Request;

    move-result-object v1

    move-object v0, v1

    .line 169
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeaderNames()Ljava/util/ListIterator;

    move-result-object v1

    .line 170
    .local v1, "headerNames":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 171
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 172
    .local v2, "headerName":Ljava/lang/String;
    invoke-interface {v0, v2}, Landroid/javax/sip/message/Request;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v3

    if-nez v3, :cond_2

    .line 173
    invoke-virtual {v10, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;

    move-result-object v3

    .line 174
    .local v3, "iterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/header/Header;

    invoke-interface {v0, v4}, Landroid/javax/sip/message/Request;->addHeader(Landroid/javax/sip/header/Header;)V

    goto :goto_1

    .line 176
    .end local v2    # "headerName":Ljava/lang/String;
    .end local v3    # "iterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/gov/nist/javax/sip/header/SIPHeader;>;"
    :cond_2
    goto :goto_0

    .line 170
    :cond_3
    move-object v9, v0

    goto :goto_3

    .line 160
    .end local v1    # "headerNames":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_4
    :goto_2
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/message/SIPRequest;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/message/Request;

    move-object v0, v1

    move-object v9, v0

    .line 183
    .end local v0    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .local v9, "reoriginatedRequest":Landroid/javax/sip/message/Request;
    :goto_3
    invoke-direct {v12, v9}, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->removeBranchID(Landroid/javax/sip/message/Request;)V

    .line 185
    if-eqz v13, :cond_12

    if-eqz v9, :cond_12

    .line 189
    const/4 v0, 0x0

    .line 191
    .local v0, "authHeaders":Ljava/util/ListIterator;
    invoke-interface/range {p1 .. p1}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v1

    const/16 v2, 0x191

    if-ne v1, v2, :cond_5

    .line 192
    const-string/jumbo v1, "WWW-Authenticate"

    invoke-interface {v13, v1}, Landroid/javax/sip/message/Response;->getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;

    move-result-object v1

    move-object v0, v1

    move-object/from16 v16, v0

    goto :goto_4

    .line 193
    :cond_5
    invoke-interface/range {p1 .. p1}, Landroid/javax/sip/message/Response;->getStatusCode()I

    move-result v1

    const/16 v2, 0x197

    if-ne v1, v2, :cond_11

    .line 194
    const-string/jumbo v1, "Proxy-Authenticate"

    invoke-interface {v13, v1}, Landroid/javax/sip/message/Response;->getHeaders(Ljava/lang/String;)Ljava/util/ListIterator;

    move-result-object v1

    move-object v0, v1

    move-object/from16 v16, v0

    .line 199
    .end local v0    # "authHeaders":Ljava/util/ListIterator;
    .local v16, "authHeaders":Ljava/util/ListIterator;
    :goto_4
    if-eqz v16, :cond_10

    .line 206
    const-string v0, "Authorization"

    invoke-interface {v9, v0}, Landroid/javax/sip/message/Request;->removeHeader(Ljava/lang/String;)V

    .line 207
    const-string/jumbo v0, "Proxy-Authorization"

    invoke-interface {v9, v0}, Landroid/javax/sip/message/Request;->removeHeader(Ljava/lang/String;)V

    .line 213
    const-string v0, "CSeq"

    invoke-interface {v9, v0}, Landroid/javax/sip/message/Request;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v0

    check-cast v0, Landroid/javax/sip/header/CSeqHeader;
    :try_end_0
    .catch Landroid/javax/sip/SipException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object v8, v0

    .line 215
    .local v8, "cSeq":Landroid/javax/sip/header/CSeqHeader;
    :try_start_1
    invoke-interface {v8}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-interface {v8, v0, v1}, Landroid/javax/sip/header/CSeqHeader;->setSeqNumber(J)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/javax/sip/SipException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 219
    nop

    .line 225
    if-nez p5, :cond_6

    :try_start_2
    invoke-virtual {v10}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getRouteHeaders()Landroid/gov/nist/javax/sip/header/RouteList;

    move-result-object v0

    if-nez v0, :cond_6

    .line 226
    move-object v0, v14

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;

    invoke-interface {v0}, Landroid/gov/nist/javax/sip/stack/SIPClientTransaction;->getNextHop()Landroid/javax/sip/address/Hop;

    move-result-object v0

    .line 227
    .local v0, "hop":Landroid/javax/sip/address/Hop;
    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v1

    check-cast v1, Landroid/javax/sip/address/SipURI;

    .line 228
    .local v1, "sipUri":Landroid/javax/sip/address/SipURI;
    invoke-interface {v0}, Landroid/javax/sip/address/Hop;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/javax/sip/address/SipURI;->setMAddrParam(Ljava/lang/String;)V

    .line 229
    invoke-interface {v0}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_6

    invoke-interface {v0}, Landroid/javax/sip/address/Hop;->getPort()I

    move-result v2

    invoke-interface {v1, v2}, Landroid/javax/sip/address/SipURI;->setPort(I)V

    .line 231
    .end local v0    # "hop":Landroid/javax/sip/address/Hop;
    .end local v1    # "sipUri":Landroid/javax/sip/address/SipURI;
    :cond_6
    move-object/from16 v7, p3

    invoke-interface {v7, v9}, Landroid/javax/sip/SipProvider;->getNewClientTransaction(Landroid/javax/sip/message/Request;)Landroid/javax/sip/ClientTransaction;

    move-result-object v0

    .line 234
    .local v0, "retryTran":Landroid/javax/sip/ClientTransaction;
    const/4 v1, 0x0

    .line 235
    .local v1, "authHeader":Landroid/javax/sip/header/WWWAuthenticateHeader;
    invoke-interface/range {p2 .. p2}, Landroid/javax/sip/ClientTransaction;->getRequest()Landroid/javax/sip/message/Request;

    move-result-object v2

    invoke-interface {v2}, Landroid/javax/sip/message/Request;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v2

    check-cast v2, Landroid/javax/sip/address/SipURI;

    move-object/from16 v17, v2

    .line 236
    .local v17, "requestUri":Landroid/javax/sip/address/SipURI;
    :goto_5
    invoke-interface/range {v16 .. v16}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 237
    invoke-interface/range {v16 .. v16}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/javax/sip/header/WWWAuthenticateHeader;

    .line 238
    .end local v1    # "authHeader":Landroid/javax/sip/header/WWWAuthenticateHeader;
    .local v5, "authHeader":Landroid/javax/sip/header/WWWAuthenticateHeader;
    invoke-interface {v5}, Landroid/javax/sip/header/WWWAuthenticateHeader;->getRealm()Ljava/lang/String;

    move-result-object v1

    move-object v6, v1

    .line 239
    .local v6, "realm":Ljava/lang/String;
    const/16 v18, 0x0

    .line 241
    .local v18, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    iget-object v1, v12, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->accountManager:Ljava/lang/Object;

    instance-of v1, v1, Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;
    :try_end_2
    .catch Landroid/javax/sip/SipException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const-string v2, ""

    const-string v3, "Cannot find user creds for the given user name and realm"

    if-eqz v1, :cond_9

    .line 242
    :try_start_3
    iget-object v1, v12, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->accountManager:Ljava/lang/Object;

    check-cast v1, Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;

    invoke-interface {v1, v14, v6}, Landroid/gov/nist/javax/sip/clientauthutils/SecureAccountManager;->getCredentialHash(Landroid/javax/sip/ClientTransaction;Ljava/lang/String;)Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;

    move-result-object v1

    move-object/from16 v19, v1

    .line 244
    .local v19, "credHash":Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;
    if-eqz v19, :cond_8

    .line 249
    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v1

    move-object/from16 v20, v1

    .line 250
    .local v20, "uri":Landroid/javax/sip/address/URI;
    invoke-interface/range {v19 .. v19}, Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;->getSipDomain()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v21, v1

    .line 251
    .local v21, "sipDomain":Ljava/lang/String;
    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-interface/range {v20 .. v20}, Landroid/javax/sip/address/URI;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getContent()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_7

    move-object/from16 v22, v2

    goto :goto_6

    :cond_7
    new-instance v1, Ljava/lang/String;

    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getRawContent()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    move-object/from16 v22, v1

    :goto_6
    move-object/from16 v1, p0

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, v22

    move-object v13, v6

    .end local v6    # "realm":Ljava/lang/String;
    .local v13, "realm":Ljava/lang/String;
    move-object/from16 v6, v19

    invoke-direct/range {v1 .. v6}, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->getAuthorization(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/javax/sip/header/WWWAuthenticateHeader;Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;)Landroid/javax/sip/header/AuthorizationHeader;

    move-result-object v1

    .line 255
    .end local v18    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .end local v19    # "credHash":Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;
    .end local v20    # "uri":Landroid/javax/sip/address/URI;
    .local v1, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    move-object/from16 v19, v8

    move-object v4, v9

    move-object v2, v10

    move v3, v11

    goto :goto_9

    .line 245
    .end local v1    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .end local v13    # "realm":Ljava/lang/String;
    .end local v21    # "sipDomain":Ljava/lang/String;
    .restart local v6    # "realm":Ljava/lang/String;
    .restart local v18    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .restart local v19    # "credHash":Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;
    :cond_8
    move-object v13, v6

    .end local v6    # "realm":Ljava/lang/String;
    .restart local v13    # "realm":Ljava/lang/String;
    sget-object v1, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string v2, "Could not find creds"

    invoke-interface {v1, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 246
    new-instance v1, Landroid/javax/sip/SipException;

    invoke-direct {v1, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local p1    # "challenge":Landroid/javax/sip/message/Response;
    .end local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .end local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .end local p4    # "cacheTime":I
    .end local p5    # "looseRouting":Z
    throw v1

    .line 256
    .end local v13    # "realm":Ljava/lang/String;
    .end local v19    # "credHash":Landroid/gov/nist/javax/sip/clientauthutils/UserCredentialHash;
    .restart local v6    # "realm":Ljava/lang/String;
    .restart local p1    # "challenge":Landroid/javax/sip/message/Response;
    .restart local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .restart local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .restart local p4    # "cacheTime":I
    .restart local p5    # "looseRouting":Z
    :cond_9
    move-object v13, v6

    .end local v6    # "realm":Ljava/lang/String;
    .restart local v13    # "realm":Ljava/lang/String;
    iget-object v1, v12, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->accountManager:Ljava/lang/Object;

    check-cast v1, Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;

    invoke-interface {v1, v14, v13}, Landroid/gov/nist/javax/sip/clientauthutils/AccountManager;->getCredentials(Landroid/javax/sip/ClientTransaction;Ljava/lang/String;)Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;

    move-result-object v1

    .line 258
    .local v1, "userCreds":Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;
    if-eqz v1, :cond_d

    .line 262
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;->getSipDomain()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v21, v3

    .line 267
    .restart local v21    # "sipDomain":Ljava/lang/String;
    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getRequestURI()Landroid/javax/sip/address/URI;

    move-result-object v4

    invoke-interface {v4}, Landroid/javax/sip/address/URI;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getContent()Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_a

    :goto_7
    goto :goto_8

    :cond_a
    new-instance v2, Ljava/lang/String;

    invoke-interface {v9}, Landroid/javax/sip/message/Request;->getRawContent()[B

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/lang/String;-><init>([B)V

    goto :goto_7

    :goto_8
    move-object/from16 v6, p0

    move-object v7, v3

    move-object/from16 v19, v8

    .end local v8    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .local v19, "cSeq":Landroid/javax/sip/header/CSeqHeader;
    move-object v8, v4

    move-object v4, v9

    .end local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .local v4, "reoriginatedRequest":Landroid/javax/sip/message/Request;
    move-object v9, v2

    move-object v2, v10

    .end local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .local v2, "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    move-object v10, v5

    move v3, v11

    move-object v11, v1

    invoke-direct/range {v6 .. v11}, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->getAuthorization(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/javax/sip/header/WWWAuthenticateHeader;Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;)Landroid/javax/sip/header/AuthorizationHeader;

    move-result-object v6

    .end local v18    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .local v6, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    move-object v1, v6

    .line 273
    .end local v6    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .local v1, "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    :goto_9
    sget-object v6, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v6, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 274
    sget-object v6, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Created authorization header: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 279
    :cond_b
    if-eqz v15, :cond_c

    .line 280
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v6

    invoke-interface {v6}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v6

    .line 281
    .local v6, "callId":Ljava/lang/String;
    iget-object v7, v12, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->cachedCredentials:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    invoke-virtual {v7, v6, v1, v15}, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->cacheAuthorizationHeader(Ljava/lang/String;Landroid/javax/sip/header/AuthorizationHeader;I)V

    .line 284
    .end local v6    # "callId":Ljava/lang/String;
    :cond_c
    invoke-interface {v4, v1}, Landroid/javax/sip/message/Request;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 285
    .end local v1    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .end local v13    # "realm":Ljava/lang/String;
    .end local v21    # "sipDomain":Ljava/lang/String;
    move-object/from16 v13, p1

    move-object/from16 v7, p3

    move-object v10, v2

    move v11, v3

    move-object v9, v4

    move-object v1, v5

    move-object/from16 v8, v19

    goto/16 :goto_5

    .line 259
    .end local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v19    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .local v1, "userCreds":Landroid/gov/nist/javax/sip/clientauthutils/UserCredentials;
    .restart local v8    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .restart local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v13    # "realm":Ljava/lang/String;
    .restart local v18    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    :cond_d
    move-object/from16 v19, v8

    move-object v4, v9

    move-object v2, v10

    .end local v8    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .end local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v19    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    new-instance v6, Landroid/javax/sip/SipException;

    invoke-direct {v6, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local p1    # "challenge":Landroid/javax/sip/message/Response;
    .end local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .end local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .end local p4    # "cacheTime":I
    .end local p5    # "looseRouting":Z
    throw v6

    .line 288
    .end local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v5    # "authHeader":Landroid/javax/sip/header/WWWAuthenticateHeader;
    .end local v13    # "realm":Ljava/lang/String;
    .end local v18    # "authorization":Landroid/javax/sip/header/AuthorizationHeader;
    .end local v19    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .local v1, "authHeader":Landroid/javax/sip/header/WWWAuthenticateHeader;
    .restart local v8    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .restart local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "challenge":Landroid/javax/sip/message/Response;
    .restart local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .restart local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .restart local p4    # "cacheTime":I
    .restart local p5    # "looseRouting":Z
    :cond_e
    move-object/from16 v19, v8

    move-object v4, v9

    move-object v2, v10

    move v3, v11

    .end local v8    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .end local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v19    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    sget-object v5, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v5, v3}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 289
    sget-object v3, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Returning authorization transaction."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 293
    :cond_f
    return-object v0

    .line 216
    .end local v0    # "retryTran":Landroid/javax/sip/ClientTransaction;
    .end local v1    # "authHeader":Landroid/javax/sip/header/WWWAuthenticateHeader;
    .end local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v17    # "requestUri":Landroid/javax/sip/address/SipURI;
    .end local v19    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .restart local v8    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .restart local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    :catch_0
    move-exception v0

    move-object/from16 v19, v8

    move-object v4, v9

    move-object v2, v10

    .line 217
    .end local v8    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .end local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .local v0, "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v19    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    new-instance v1, Landroid/javax/sip/SipException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid CSeq -- could not increment : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface/range {v19 .. v19}, Landroid/javax/sip/header/CSeqHeader;->getSeqNumber()J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;)V

    .end local p1    # "challenge":Landroid/javax/sip/message/Response;
    .end local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .end local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .end local p4    # "cacheTime":I
    .end local p5    # "looseRouting":Z
    throw v1

    .line 200
    .end local v0    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .end local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v19    # "cSeq":Landroid/javax/sip/header/CSeqHeader;
    .restart local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "challenge":Landroid/javax/sip/message/Response;
    .restart local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .restart local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .restart local p4    # "cacheTime":I
    .restart local p5    # "looseRouting":Z
    :cond_10
    move-object v4, v9

    move-object v2, v10

    .end local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Could not find WWWAuthenticate or ProxyAuthenticate headers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "challenge":Landroid/javax/sip/message/Response;
    .end local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .end local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .end local p4    # "cacheTime":I
    .end local p5    # "looseRouting":Z
    throw v0

    .line 196
    .end local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v16    # "authHeaders":Ljava/util/ListIterator;
    .local v0, "authHeaders":Ljava/util/ListIterator;
    .restart local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "challenge":Landroid/javax/sip/message/Response;
    .restart local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .restart local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .restart local p4    # "cacheTime":I
    .restart local p5    # "looseRouting":Z
    :cond_11
    move-object v4, v9

    move-object v2, v10

    .end local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Unexpected status code "

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "challenge":Landroid/javax/sip/message/Response;
    .end local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .end local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .end local p4    # "cacheTime":I
    .end local p5    # "looseRouting":Z
    throw v1

    .line 185
    .end local v0    # "authHeaders":Ljava/util/ListIterator;
    .end local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local p1    # "challenge":Landroid/javax/sip/message/Response;
    .restart local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .restart local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .restart local p4    # "cacheTime":I
    .restart local p5    # "looseRouting":Z
    :cond_12
    move-object v4, v9

    move-object v2, v10

    .line 186
    .end local v9    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .end local v10    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .restart local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "A null argument was passed to handle challenge."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .end local p1    # "challenge":Landroid/javax/sip/message/Response;
    .end local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .end local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .end local p4    # "cacheTime":I
    .end local p5    # "looseRouting":Z
    throw v0
    :try_end_3
    .catch Landroid/javax/sip/SipException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 296
    .end local v2    # "challengedRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    .end local v4    # "reoriginatedRequest":Landroid/javax/sip/message/Request;
    .restart local p1    # "challenge":Landroid/javax/sip/message/Response;
    .restart local p2    # "challengedTransaction":Landroid/javax/sip/ClientTransaction;
    .restart local p3    # "transactionCreator":Landroid/javax/sip/SipProvider;
    .restart local p4    # "cacheTime":I
    .restart local p5    # "looseRouting":Z
    :catch_1
    move-exception v0

    .line 297
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v2, "Unexpected exception "

    invoke-interface {v1, v2, v0}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 298
    new-instance v1, Landroid/javax/sip/SipException;

    invoke-direct {v1, v2, v0}, Landroid/javax/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 294
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 295
    .local v0, "ex":Landroid/javax/sip/SipException;
    throw v0
.end method

.method public removeCachedAuthenticationHeaders(Ljava/lang/String;)V
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;

    .line 485
    if-eqz p1, :cond_0

    .line 487
    iget-object v0, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->cachedCredentials:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->removeAuthenticationHeader(Ljava/lang/String;)V

    .line 489
    return-void

    .line 486
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null callId argument "

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAuthenticationHeaders(Landroid/javax/sip/message/Request;)V
    .locals 6
    .param p1, "request"    # Landroid/javax/sip/message/Request;

    .line 459
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    .line 461
    .local v0, "sipRequest":Landroid/gov/nist/javax/sip/message/SIPRequest;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    invoke-interface {v1}, Landroid/javax/sip/header/CallIdHeader;->getCallId()Ljava/lang/String;

    move-result-object v1

    .line 463
    .local v1, "callId":Ljava/lang/String;
    const-string v2, "Authorization"

    invoke-interface {p1, v2}, Landroid/javax/sip/message/Request;->removeHeader(Ljava/lang/String;)V

    .line 464
    iget-object v2, p0, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->cachedCredentials:Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;

    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sip/clientauthutils/CredentialsCache;->getCachedAuthorizationHeaders(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v2

    .line 466
    .local v2, "authHeaders":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/javax/sip/header/AuthorizationHeader;>;"
    if-nez v2, :cond_1

    .line 467
    sget-object v3, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 468
    sget-object v3, Landroid/gov/nist/javax/sip/clientauthutils/AuthenticationHelperImpl;->logger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not find authentication headers for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 470
    :cond_0
    return-void

    .line 473
    :cond_1
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sip/header/AuthorizationHeader;

    .line 474
    .local v4, "authHeader":Landroid/javax/sip/header/AuthorizationHeader;
    invoke-interface {p1, v4}, Landroid/javax/sip/message/Request;->addHeader(Landroid/javax/sip/header/Header;)V

    .line 475
    .end local v4    # "authHeader":Landroid/javax/sip/header/AuthorizationHeader;
    goto :goto_0

    .line 477
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    return-void
.end method
