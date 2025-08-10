.class public Landroid/gov/nist/core/CommonLoggerLog4j;
.super Ljava/lang/Object;
.source "CommonLoggerLog4j.java"

# interfaces
.implements Landroid/gov/nist/core/StackLogger;


# instance fields
.field private logger:Lorg/apache/log4j/Logger;


# direct methods
.method public constructor <init>(Lorg/apache/log4j/Logger;)V
    .locals 0
    .param p1, "logger"    # Lorg/apache/log4j/Logger;

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    iput-object p1, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    .line 190
    return-void
.end method

.method public static intToLevel(I)Lorg/apache/log4j/Level;
    .locals 1
    .param p0, "intLevel"    # I

    .line 264
    sparse-switch p0, :sswitch_data_0

    .line 272
    sget-object v0, Lorg/apache/log4j/Level;->OFF:Lorg/apache/log4j/Level;

    return-object v0

    .line 269
    :sswitch_0
    sget-object v0, Lorg/apache/log4j/Level;->TRACE:Lorg/apache/log4j/Level;

    return-object v0

    .line 266
    :sswitch_1
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    return-object v0

    .line 265
    :sswitch_2
    sget-object v0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    return-object v0

    .line 268
    :sswitch_3
    sget-object v0, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    return-object v0

    .line 267
    :sswitch_4
    sget-object v0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    return-object v0

    .line 270
    :sswitch_5
    sget-object v0, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_5
        0x4 -> :sswitch_4
        0x8 -> :sswitch_3
        0x10 -> :sswitch_2
        0x20 -> :sswitch_1
        0x40 -> :sswitch_0
    .end sparse-switch
.end method

.method public static levelToInt(Lorg/apache/log4j/Level;)I
    .locals 1
    .param p0, "level"    # Lorg/apache/log4j/Level;

    .line 277
    sget-object v0, Lorg/apache/log4j/Level;->INFO:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/Level;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 278
    const/16 v0, 0x10

    return v0

    .line 279
    :cond_0
    sget-object v0, Lorg/apache/log4j/Level;->ERROR:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/Level;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 280
    const/4 v0, 0x4

    return v0

    .line 281
    :cond_1
    sget-object v0, Lorg/apache/log4j/Level;->DEBUG:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/Level;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 282
    const/16 v0, 0x20

    return v0

    .line 283
    :cond_2
    sget-object v0, Lorg/apache/log4j/Level;->WARN:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/Level;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 284
    const/16 v0, 0x8

    return v0

    .line 285
    :cond_3
    sget-object v0, Lorg/apache/log4j/Level;->TRACE:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/Level;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 286
    const/16 v0, 0x40

    return v0

    .line 287
    :cond_4
    sget-object v0, Lorg/apache/log4j/Level;->FATAL:Lorg/apache/log4j/Level;

    invoke-virtual {p0, v0}, Lorg/apache/log4j/Level;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 288
    const/4 v0, 0x2

    return v0

    .line 290
    :cond_5
    const/4 v0, 0x0

    return v0
.end method

.method private setTraceLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .line 156
    return-void
.end method


# virtual methods
.method public addAppender(Lorg/apache/log4j/Appender;)V
    .locals 1
    .param p1, "appender"    # Lorg/apache/log4j/Appender;

    .line 108
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->addAppender(Lorg/apache/log4j/Appender;)V

    .line 110
    return-void
.end method

.method public disableLogging()V
    .locals 0

    .line 253
    return-void
.end method

.method public enableLogging()V
    .locals 0

    .line 261
    return-void
.end method

.method public getLineCount()I
    .locals 1

    .line 86
    const/4 v0, 0x0

    return v0
.end method

.method public getLogger()Lorg/apache/log4j/Logger;
    .locals 1

    .line 95
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    return-object v0
.end method

.method public getLoggerName()Ljava/lang/String;
    .locals 1

    .line 294
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0}, Lorg/apache/log4j/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 297
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTraceLevel()I
    .locals 1

    .line 162
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0}, Lorg/apache/log4j/Logger;->getLevel()Lorg/apache/log4j/Level;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/CommonLoggerLog4j;->levelToInt(Lorg/apache/log4j/Level;)I

    move-result v0

    return v0
.end method

.method public isLoggingEnabled()Z
    .locals 1

    .line 203
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0}, Lorg/apache/log4j/Logger;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public isLoggingEnabled(I)Z
    .locals 2
    .param p1, "logLevel"    # I

    .line 212
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-static {p1}, Landroid/gov/nist/core/CommonLoggerLog4j;->intToLevel(I)Lorg/apache/log4j/Level;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Logger;->isEnabledFor(Lorg/apache/log4j/Priority;)Z

    move-result v0

    return v0
.end method

.method public logDebug(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 129
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 131
    return-void
.end method

.method public logDebug(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .line 138
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 139
    return-void
.end method

.method public logError(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 184
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->error(Ljava/lang/Object;)V

    .line 186
    return-void
.end method

.method public logError(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .line 223
    invoke-virtual {p0}, Landroid/gov/nist/core/CommonLoggerLog4j;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    .line 224
    .local v0, "logger":Lorg/apache/log4j/Logger;
    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Logger;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 226
    return-void
.end method

.method public logException(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "ex"    # Ljava/lang/Throwable;

    .line 119
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    const-string v1, "Error"

    invoke-virtual {v0, v1, p1}, Lorg/apache/log4j/Logger;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 120
    return-void
.end method

.method public logFatalError(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 172
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->fatal(Ljava/lang/Object;)V

    .line 174
    return-void
.end method

.method public logInfo(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 244
    invoke-virtual {p0}, Landroid/gov/nist/core/CommonLoggerLog4j;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->info(Ljava/lang/Object;)V

    .line 245
    return-void
.end method

.method public logStackTrace()V
    .locals 1

    .line 59
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/CommonLoggerLog4j;->logStackTrace(I)V

    .line 61
    return-void
.end method

.method public logStackTrace(I)V
    .locals 6
    .param p1, "traceLevel"    # I

    .line 65
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 66
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 67
    .local v1, "pw":Ljava/io/PrintWriter;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    .line 69
    .local v2, "ste":[Ljava/lang/StackTraceElement;
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    .line 70
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

    .line 72
    .local v4, "callFrame":Ljava/lang/String;
    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 69
    .end local v4    # "callFrame":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 74
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 75
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 76
    .local v3, "stackTrace":Ljava/lang/String;
    iget-object v4, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v4, v3}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 78
    return-void
.end method

.method public logTrace(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 148
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->debug(Ljava/lang/Object;)V

    .line 149
    return-void
.end method

.method public logWarning(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 234
    invoke-virtual {p0}, Landroid/gov/nist/core/CommonLoggerLog4j;->getLogger()Lorg/apache/log4j/Logger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Logger;->warn(Ljava/lang/Object;)V

    .line 236
    return-void
.end method

.method public setBuildTimeStamp(Ljava/lang/String;)V
    .locals 3
    .param p1, "buildTimeStamp"    # Ljava/lang/String;

    .line 302
    iget-object v0, p0, Landroid/gov/nist/core/CommonLoggerLog4j;->logger:Lorg/apache/log4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Build timestamp: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Logger;->info(Ljava/lang/Object;)V

    .line 303
    return-void
.end method

.method public setStackProperties(Ljava/util/Properties;)V
    .locals 0
    .param p1, "configurationProperties"    # Ljava/util/Properties;

    .line 196
    return-void
.end method
