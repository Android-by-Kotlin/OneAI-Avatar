.class public Landroid/gov/nist/core/LogWriter;
.super Ljava/lang/Object;
.source "LogWriter.java"

# interfaces
.implements Landroid/gov/nist/core/StackLogger;


# instance fields
.field private buildTimeStamp:Ljava/lang/String;

.field private configurationProperties:Ljava/util/Properties;

.field private lineCount:I

.field private logFileName:Ljava/lang/String;

.field private logger:Lorg/apache/log4j/Logger;

.field private volatile needsLogging:Z

.field private stackName:Ljava/lang/String;

.field protected traceLevel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 299
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/core/LogWriter;->logFileName:Ljava/lang/String;

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    .line 82
    iput v0, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    .line 300
    return-void
.end method

.method private countLines(Ljava/lang/String;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;

    .line 174
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 175
    .local v0, "chars":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 176
    aget-char v2, v0, v1

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 177
    iget v2, p0, Landroid/gov/nist/core/LogWriter;->lineCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Landroid/gov/nist/core/LogWriter;->lineCount:I

    .line 175
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 180
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private enhanceMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "message"    # Ljava/lang/String;

    .line 190
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 191
    .local v0, "stackTrace":[Ljava/lang/StackTraceElement;
    const/4 v1, 0x3

    aget-object v1, v0, v1

    .line 192
    .local v1, "elem":Ljava/lang/StackTraceElement;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    .line 193
    .local v2, "className":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    .line 194
    .local v3, "methodName":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v4

    .line 195
    .local v4, "fileName":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v5

    .line 196
    .local v5, "lineNumber":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 198
    .local v6, "newMessage":Ljava/lang/String;
    return-object v6
.end method

.method private setTraceLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .line 260
    iput p1, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    .line 261
    return-void
.end method


# virtual methods
.method public addAppender(Lorg/apache/log4j/Appender;)V
    .locals 1
    .param p1, "appender"    # Lorg/apache/log4j/Appender;

    .line 146
    iget-object v0, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->addAppender(Lorg/apache/log4j/Appender;)V

    .line 148
    return-void
.end method

.method public disableLogging()V
    .locals 1

    .line 469
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    .line 470
    return-void
.end method

.method public enableLogging()V
    .locals 1

    .line 476
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    .line 478
    return-void
.end method

.method public getLevel(I)Lorg/apache/log4j/Level;
    .locals 1
    .param p1, "traceLevel"    # I

    .line 500
    const/16 v0, 0x10

    if-ne p1, v0, :cond_0

    .line 501
    sget-object v0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    return-object v0

    .line 502
    :cond_0
    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 503
    sget-object v0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    return-object v0

    .line 504
    :cond_1
    const/16 v0, 0x20

    if-ne p1, v0, :cond_2

    .line 505
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    return-object v0

    .line 506
    :cond_2
    const/16 v0, 0x40

    if-ne p1, v0, :cond_3

    .line 507
    sget-object v0, Lorg/apache/log4j/Level;->ALL:Lorg/apache/log4j/Level;

    return-object v0

    .line 509
    :cond_3
    sget-object v0, Lorg/apache/log4j/Level;->OFF:Lorg/apache/log4j/Level;

    return-object v0
.end method

.method public getLineCount()I
    .locals 1

    .line 124
    iget v0, p0, Landroid/gov/nist/core/LogWriter;->lineCount:I

    return v0
.end method

.method public getLogPriority()Lorg/apache/log4j/Priority;
    .locals 2

    .line 486
    iget v0, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    .line 487
    sget-object v0, Lorg/apache/log4j/Priority;->INFO:Lorg/apache/log4j/Priority;

    return-object v0

    .line 488
    :cond_0
    iget v0, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 489
    sget-object v0, Lorg/apache/log4j/Priority;->ERROR:Lorg/apache/log4j/Priority;

    return-object v0

    .line 490
    :cond_1
    iget v0, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    const/16 v1, 0x20

    if-ne v0, v1, :cond_2

    .line 491
    sget-object v0, Lorg/apache/log4j/Priority;->DEBUG:Lorg/apache/log4j/Priority;

    return-object v0

    .line 492
    :cond_2
    iget v0, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    const/16 v1, 0x40

    if-ne v0, v1, :cond_3

    .line 493
    sget-object v0, Lorg/apache/log4j/Priority;->DEBUG:Lorg/apache/log4j/Priority;

    return-object v0

    .line 495
    :cond_3
    sget-object v0, Lorg/apache/log4j/Priority;->FATAL:Lorg/apache/log4j/Priority;

    return-object v0
.end method

.method public getLogger()Lorg/apache/log4j/Logger;
    .locals 1

    .line 133
    iget-object v0, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    return-object v0
.end method

.method public getLoggerName()Ljava/lang/String;
    .locals 1

    .line 514
    iget-object v0, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    if-eqz v0, :cond_0

    .line 515
    iget-object v0, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0}, Lorg/apache/log4j/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 517
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTraceLevel()I
    .locals 1

    .line 267
    iget v0, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    return v0
.end method

.method public isLoggingEnabled()Z
    .locals 1

    .line 420
    iget-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    return v0
.end method

.method public isLoggingEnabled(I)Z
    .locals 1
    .param p1, "logLevel"    # I

    .line 429
    iget-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public logDebug(Ljava/lang/String;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;

    .line 209
    iget-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    if-eqz v0, :cond_1

    .line 210
    invoke-direct {p0, p1}, Landroid/gov/nist/core/LogWriter;->enhanceMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "newMessage":Ljava/lang/String;
    iget v1, p0, Landroid/gov/nist/core/LogWriter;->lineCount:I

    if-nez v1, :cond_0

    .line 212
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BUILD TIMESTAMP = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/LogWriter;->buildTimeStamp:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 213
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Config Propeties = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/LogWriter;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 215
    :cond_0
    invoke-direct {p0, v0}, Landroid/gov/nist/core/LogWriter;->countLines(Ljava/lang/String;)V

    .line 216
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 219
    .end local v0    # "newMessage":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public logDebug(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .line 226
    iget-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    if-eqz v0, :cond_1

    .line 227
    invoke-direct {p0, p1}, Landroid/gov/nist/core/LogWriter;->enhanceMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 228
    .local v0, "newMessage":Ljava/lang/String;
    iget v1, p0, Landroid/gov/nist/core/LogWriter;->lineCount:I

    if-nez v1, :cond_0

    .line 229
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BUILD TIMESTAMP = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/LogWriter;->buildTimeStamp:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 230
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Config Propeties = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/LogWriter;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 232
    :cond_0
    invoke-direct {p0, v0}, Landroid/gov/nist/core/LogWriter;->countLines(Ljava/lang/String;)V

    .line 233
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 235
    .end local v0    # "newMessage":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public logError(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 292
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 293
    .local v0, "logger":Lorg/apache/log4j/Logger;
    invoke-direct {p0, p1}, Landroid/gov/nist/core/LogWriter;->enhanceMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 294
    .local v1, "newMsg":Ljava/lang/String;
    invoke-direct {p0, v1}, Landroid/gov/nist/core/LogWriter;->countLines(Ljava/lang/String;)V

    .line 295
    invoke-virtual {v0, v1}, Lorg/apache/log4j/Logger;->error(Ljava/lang/Object;)V

    .line 297
    return-void
.end method

.method public logError(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .line 440
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 441
    .local v0, "logger":Lorg/apache/log4j/Logger;
    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Logger;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 443
    return-void
.end method

.method public logException(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "ex"    # Ljava/lang/Throwable;

    .line 157
    iget-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/log4j/Logger;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 161
    :cond_0
    return-void
.end method

.method public logFatalError(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 277
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 278
    .local v0, "logger":Lorg/apache/log4j/Logger;
    invoke-direct {p0, p1}, Landroid/gov/nist/core/LogWriter;->enhanceMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 279
    .local v1, "newMsg":Ljava/lang/String;
    invoke-direct {p0, v1}, Landroid/gov/nist/core/LogWriter;->countLines(Ljava/lang/String;)V

    .line 280
    invoke-virtual {v0, v1}, Lorg/apache/log4j/Logger;->fatal(Ljava/lang/Object;)V

    .line 282
    return-void
.end method

.method public logInfo(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 461
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->info(Ljava/lang/Object;)V

    .line 462
    return-void
.end method

.method public logStackTrace()V
    .locals 1

    .line 92
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/LogWriter;->logStackTrace(I)V

    .line 94
    return-void
.end method

.method public logStackTrace(I)V
    .locals 7
    .param p1, "traceLevel"    # I

    .line 97
    iget-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    if-eqz v0, :cond_1

    .line 98
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 99
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 100
    .local v1, "pw":Ljava/io/PrintWriter;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    .line 102
    .local v2, "ste":[Ljava/lang/StackTraceElement;
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    .line 103
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v2, v3

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v2, v3

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, "callFrame":Ljava/lang/String;
    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 102
    .end local v4    # "callFrame":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 107
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 108
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 109
    .local v3, "stackTrace":Ljava/lang/String;
    invoke-virtual {p0, p1}, Landroid/gov/nist/core/LogWriter;->getLevel(I)Lorg/apache/log4j/Level;

    move-result-object v4

    .line 110
    .local v4, "level":Lorg/apache/log4j/Level;
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogPriority()Lorg/apache/log4j/Priority;

    move-result-object v5

    .line 111
    .local v5, "priority":Lorg/apache/log4j/Priority;
    invoke-virtual {v4, v5}, Lorg/apache/log4j/Level;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 112
    iget-object v6, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v6, v4, v3}, Lorg/apache/log4j/Logger;->log(Lorg/apache/log4j/Priority;Ljava/lang/Object;)V

    .line 116
    .end local v0    # "sw":Ljava/io/StringWriter;
    .end local v1    # "pw":Ljava/io/PrintWriter;
    .end local v2    # "ste":[Ljava/lang/StackTraceElement;
    .end local v3    # "stackTrace":Ljava/lang/String;
    .end local v4    # "level":Lorg/apache/log4j/Level;
    .end local v5    # "priority":Lorg/apache/log4j/Priority;
    :cond_1
    return-void
.end method

.method public logTrace(Ljava/lang/String;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;

    .line 244
    iget-boolean v0, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    if-eqz v0, :cond_1

    .line 245
    invoke-direct {p0, p1}, Landroid/gov/nist/core/LogWriter;->enhanceMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 246
    .local v0, "newMessage":Ljava/lang/String;
    iget v1, p0, Landroid/gov/nist/core/LogWriter;->lineCount:I

    if-nez v1, :cond_0

    .line 247
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BUILD TIMESTAMP = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/LogWriter;->buildTimeStamp:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 248
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Config Propeties = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/LogWriter;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 250
    :cond_0
    invoke-direct {p0, v0}, Landroid/gov/nist/core/LogWriter;->countLines(Ljava/lang/String;)V

    .line 251
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/log4j/Logger;->trace(Ljava/lang/Object;)V

    .line 254
    .end local v0    # "newMessage":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public logWarning(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 451
    invoke-virtual {p0}, Landroid/gov/nist/core/LogWriter;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->warn(Ljava/lang/Object;)V

    .line 453
    return-void
.end method

.method public setBuildTimeStamp(Ljava/lang/String;)V
    .locals 0
    .param p1, "buildTimeStamp"    # Ljava/lang/String;

    .line 481
    iput-object p1, p0, Landroid/gov/nist/core/LogWriter;->buildTimeStamp:Ljava/lang/String;

    .line 483
    return-void
.end method

.method public setStackProperties(Ljava/util/Properties;)V
    .locals 11
    .param p1, "configurationProperties"    # Ljava/util/Properties;

    .line 304
    iput-object p1, p0, Landroid/gov/nist/core/LogWriter;->configurationProperties:Ljava/util/Properties;

    .line 306
    const-string/jumbo v0, "android.gov.nist.javax.sip.TRACE_LEVEL"

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, "logLevel":Ljava/lang/String;
    const-string/jumbo v1, "android.gov.nist.javax.sip.DEBUG_LOG"

    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/core/LogWriter;->logFileName:Ljava/lang/String;

    .line 312
    const-string/jumbo v1, "android.javax.sip.STACK_NAME"

    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/gov/nist/core/LogWriter;->stackName:Ljava/lang/String;

    .line 318
    const-string/jumbo v1, "android.gov.nist.javax.sip.LOG4J_LOGGER_NAME"

    iget-object v2, p0, Landroid/gov/nist/core/LogWriter;->stackName:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 322
    .local v1, "category":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object v2

    iput-object v2, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    .line 323
    const/4 v2, 0x0

    if-eqz v0, :cond_e

    .line 324
    const-string v3, "LOG4J"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 325
    sput-boolean v2, Landroid/gov/nist/core/CommonLogger;->useLegacyLogger:Z

    goto/16 :goto_7

    .line 330
    :cond_0
    const/4 v3, 0x0

    .line 331
    .local v3, "ll":I
    :try_start_0
    const-string/jumbo v4, "TRACE"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x20

    const/4 v6, 0x1

    if-eqz v4, :cond_1

    .line 332
    const/16 v3, 0x20

    .line 333
    sput-boolean v6, Landroid/gov/nist/core/Debug;->debug:Z

    .line 334
    invoke-static {p0}, Landroid/gov/nist/core/Debug;->setStackLogger(Landroid/gov/nist/core/StackLogger;)V

    goto :goto_1

    .line 335
    :cond_1
    const-string v4, "DEBUG"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 336
    const/16 v3, 0x20

    goto :goto_1

    .line 337
    :cond_2
    const-string v4, "INFO"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 338
    const/16 v3, 0x10

    goto :goto_1

    .line 339
    :cond_3
    const-string v4, "ERROR"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 340
    const/4 v3, 0x4

    goto :goto_1

    .line 341
    :cond_4
    const-string v4, "NONE"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "OFF"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_0

    .line 344
    :cond_5
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    move v3, v4

    .line 345
    if-le v3, v5, :cond_7

    .line 346
    sput-boolean v6, Landroid/gov/nist/core/Debug;->debug:Z

    .line 347
    invoke-static {p0}, Landroid/gov/nist/core/Debug;->setStackLogger(Landroid/gov/nist/core/StackLogger;)V

    goto :goto_1

    .line 342
    :cond_6
    :goto_0
    const/4 v3, 0x0

    .line 351
    :cond_7
    :goto_1
    invoke-direct {p0, v3}, Landroid/gov/nist/core/LogWriter;->setTraceLevel(I)V

    .line 352
    iput-boolean v6, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    .line 353
    iget v4, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    if-ne v4, v5, :cond_8

    .line 354
    iget-object v4, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    sget-object v5, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-virtual {v4, v5}, Lorg/apache/log4j/Logger;->setLevel(Lorg/apache/log4j/Level;)V

    goto :goto_2

    .line 355
    :cond_8
    iget v4, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    const/16 v5, 0x10

    if-ne v4, v5, :cond_9

    .line 356
    iget-object v4, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    sget-object v5, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    invoke-virtual {v4, v5}, Lorg/apache/log4j/Logger;->setLevel(Lorg/apache/log4j/Level;)V

    goto :goto_2

    .line 357
    :cond_9
    iget v4, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_a

    .line 358
    iget-object v4, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    sget-object v5, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    invoke-virtual {v4, v5}, Lorg/apache/log4j/Logger;->setLevel(Lorg/apache/log4j/Level;)V

    goto :goto_2

    .line 359
    :cond_a
    iget v4, p0, Landroid/gov/nist/core/LogWriter;->traceLevel:I

    if-nez v4, :cond_b

    .line 360
    iget-object v4, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    sget-object v5, Lorg/apache/log4j/Level;->OFF:Lorg/apache/log4j/Level;

    invoke-virtual {v4, v5}, Lorg/apache/log4j/Logger;->setLevel(Lorg/apache/log4j/Level;)V

    .line 361
    iput-boolean v2, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    .line 368
    :cond_b
    :goto_2
    iget-boolean v4, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    if-eqz v4, :cond_d

    iget-object v4, p0, Landroid/gov/nist/core/LogWriter;->logFileName:Ljava/lang/String;

    if-eqz v4, :cond_d

    .line 370
    const-string/jumbo v4, "android.gov.nist.javax.sip.DEBUG_LOG_OVERWRITE"

    invoke-virtual {p1, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_3

    .line 374
    .local v4, "overwrite":Z
    const/4 v5, 0x0

    .line 376
    .local v5, "fa":Lorg/apache/log4j/FileAppender;
    :try_start_1
    new-instance v7, Lorg/apache/log4j/FileAppender;

    new-instance v8, Lorg/apache/log4j/SimpleLayout;

    invoke-direct {v8}, Lorg/apache/log4j/SimpleLayout;-><init>()V

    iget-object v9, p0, Landroid/gov/nist/core/LogWriter;->logFileName:Ljava/lang/String;

    if-nez v4, :cond_c

    goto :goto_3

    :cond_c
    move v6, v2

    :goto_3
    invoke-direct {v7, v8, v9, v6}, Lorg/apache/log4j/FileAppender;-><init>(Lorg/apache/log4j/Layout;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_3

    move-object v5, v7

    .line 394
    :goto_4
    goto :goto_5

    .line 392
    :catch_0
    move-exception v6

    .line 393
    .local v6, "ex":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 378
    .end local v6    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v6

    .line 382
    .local v6, "fnf":Ljava/io/FileNotFoundException;
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Landroid/gov/nist/core/LogWriter;->logFileName:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 383
    .local v7, "logfile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 384
    invoke-virtual {v7}, Ljava/io/File;->delete()Z
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_3

    .line 387
    :try_start_3
    new-instance v8, Lorg/apache/log4j/FileAppender;

    new-instance v9, Lorg/apache/log4j/SimpleLayout;

    invoke-direct {v9}, Lorg/apache/log4j/SimpleLayout;-><init>()V

    iget-object v10, p0, Landroid/gov/nist/core/LogWriter;->logFileName:Ljava/lang/String;

    invoke-direct {v8, v9, v10}, Lorg/apache/log4j/FileAppender;-><init>(Lorg/apache/log4j/Layout;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    move-object v5, v8

    .line 391
    goto :goto_4

    .line 389
    :catch_2
    move-exception v8

    .line 390
    .local v8, "ioe":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 396
    .end local v6    # "fnf":Ljava/io/FileNotFoundException;
    .end local v7    # "logfile":Ljava/io/File;
    .end local v8    # "ioe":Ljava/io/IOException;
    :goto_5
    if-eqz v5, :cond_d

    .line 397
    iget-object v6, p0, Landroid/gov/nist/core/LogWriter;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v6, v5}, Lorg/apache/log4j/Logger;->addAppender(Lorg/apache/log4j/Appender;)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_6

    .line 400
    .end local v3    # "ll":I
    .end local v4    # "overwrite":Z
    .end local v5    # "fa":Lorg/apache/log4j/FileAppender;
    :catch_3
    move-exception v3

    .line 401
    .local v3, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 402
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LogWriter: Bad integer "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 403
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v5, "logging dislabled "

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 404
    iput-boolean v2, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    .line 405
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    :cond_d
    :goto_6
    goto :goto_7

    .line 408
    :cond_e
    iput-boolean v2, p0, Landroid/gov/nist/core/LogWriter;->needsLogging:Z

    .line 413
    :goto_7
    return-void
.end method
