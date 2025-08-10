.class public Landroid/gov/nist/core/CommonLogger;
.super Ljava/lang/Object;
.source "CommonLogger.java"

# interfaces
.implements Landroid/gov/nist/core/StackLogger;


# static fields
.field public static legacyLogger:Landroid/gov/nist/core/StackLogger;

.field public static useLegacyLogger:Z


# instance fields
.field private name:Ljava/lang/String;

.field private otherLogger:Landroid/gov/nist/core/StackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const/4 v0, 0x1

    sput-boolean v0, Landroid/gov/nist/core/CommonLogger;->useLegacyLogger:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Landroid/gov/nist/core/CommonLogger;->name:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public static getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;
    .locals 1
    .param p0, "clazz"    # Ljava/lang/Class;

    .line 43
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/String;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    return-object v0
.end method

.method public static getLogger(Ljava/lang/String;)Landroid/gov/nist/core/StackLogger;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 40
    new-instance v0, Landroid/gov/nist/core/CommonLogger;

    invoke-direct {v0, p0}, Landroid/gov/nist/core/CommonLogger;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static init(Ljava/util/Properties;)V
    .locals 0
    .param p0, "p"    # Ljava/util/Properties;

    .line 48
    return-void
.end method

.method private logger()Landroid/gov/nist/core/StackLogger;
    .locals 2

    .line 26
    sget-boolean v0, Landroid/gov/nist/core/CommonLogger;->useLegacyLogger:Z

    if-eqz v0, :cond_1

    .line 27
    sget-object v0, Landroid/gov/nist/core/CommonLogger;->legacyLogger:Landroid/gov/nist/core/StackLogger;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Landroid/gov/nist/core/CommonLoggerLog4j;

    iget-object v1, p0, Landroid/gov/nist/core/CommonLogger;->name:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/gov/nist/core/CommonLoggerLog4j;-><init>(Lorg/apache/log4j/Logger;)V

    return-object v0

    .line 30
    :cond_0
    sget-object v0, Landroid/gov/nist/core/CommonLogger;->legacyLogger:Landroid/gov/nist/core/StackLogger;

    return-object v0

    .line 32
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/core/CommonLogger;->otherLogger:Landroid/gov/nist/core/StackLogger;

    if-nez v0, :cond_2

    .line 33
    new-instance v0, Landroid/gov/nist/core/CommonLoggerLog4j;

    iget-object v1, p0, Landroid/gov/nist/core/CommonLogger;->name:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/gov/nist/core/CommonLoggerLog4j;-><init>(Lorg/apache/log4j/Logger;)V

    iput-object v0, p0, Landroid/gov/nist/core/CommonLogger;->otherLogger:Landroid/gov/nist/core/StackLogger;

    .line 35
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/core/CommonLogger;->otherLogger:Landroid/gov/nist/core/StackLogger;

    return-object v0
.end method


# virtual methods
.method public disableLogging()V
    .locals 1

    .line 51
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->disableLogging()V

    .line 52
    return-void
.end method

.method public enableLogging()V
    .locals 1

    .line 55
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->enableLogging()V

    .line 57
    return-void
.end method

.method public getLineCount()I
    .locals 1

    .line 61
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->getLineCount()I

    move-result v0

    return v0
.end method

.method public getLoggerName()Ljava/lang/String;
    .locals 1

    .line 66
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->getLoggerName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isLoggingEnabled()Z
    .locals 1

    .line 71
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled()Z

    move-result v0

    return v0
.end method

.method public isLoggingEnabled(I)Z
    .locals 1
    .param p1, "logLevel"    # I

    .line 76
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v0

    return v0
.end method

.method public logDebug(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 81
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public logDebug(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .line 86
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 87
    return-void
.end method

.method public logError(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 91
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public logError(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .line 96
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/gov/nist/core/StackLogger;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 97
    return-void
.end method

.method public logException(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "ex"    # Ljava/lang/Throwable;

    .line 101
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logException(Ljava/lang/Throwable;)V

    .line 102
    return-void
.end method

.method public logFatalError(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 106
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logFatalError(Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public logInfo(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 111
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public logStackTrace()V
    .locals 1

    .line 116
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0}, Landroid/gov/nist/core/StackLogger;->logStackTrace()V

    .line 117
    return-void
.end method

.method public logStackTrace(I)V
    .locals 1
    .param p1, "traceLevel"    # I

    .line 121
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logStackTrace(I)V

    .line 122
    return-void
.end method

.method public logTrace(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 126
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logTrace(Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method public logWarning(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 131
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public setBuildTimeStamp(Ljava/lang/String;)V
    .locals 1
    .param p1, "buildTimeStamp"    # Ljava/lang/String;

    .line 136
    invoke-direct {p0}, Landroid/gov/nist/core/CommonLogger;->logger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->setBuildTimeStamp(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public setStackProperties(Ljava/util/Properties;)V
    .locals 1
    .param p1, "stackProperties"    # Ljava/util/Properties;

    .line 141
    sget-object v0, Landroid/gov/nist/core/CommonLogger;->legacyLogger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, p1}, Landroid/gov/nist/core/StackLogger;->setStackProperties(Ljava/util/Properties;)V

    .line 142
    return-void
.end method
