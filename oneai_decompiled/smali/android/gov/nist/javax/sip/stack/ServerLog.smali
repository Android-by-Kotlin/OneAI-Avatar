.class public Landroid/gov/nist/javax/sip/stack/ServerLog;
.super Ljava/lang/Object;
.source "ServerLog.java"

# interfaces
.implements Landroid/gov/nist/core/ServerLogger;


# instance fields
.field private auxInfo:Ljava/lang/String;

.field private configurationProperties:Ljava/util/Properties;

.field private description:Ljava/lang/String;

.field private logContent:Z

.field private logFileName:Ljava/lang/String;

.field private printWriter:Ljava/io/PrintWriter;

.field private sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

.field private stackIpAddress:Ljava/lang/String;

.field protected stackLogger:Landroid/gov/nist/core/StackLogger;

.field protected traceLevel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    const/16 v0, 0x10

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->traceLevel:I

    .line 91
    return-void
.end method

.method private logMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 285
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ServerLog;->checkLogFile()V

    .line 286
    move-object v0, p1

    .line 287
    .local v0, "logInfo":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    if-eqz v1, :cond_0

    .line 288
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    invoke-virtual {v1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 290
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 291
    iget-object v1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v1, v0}, Landroid/gov/nist/core/StackLogger;->logInfo(Ljava/lang/String;)V

    .line 294
    :cond_1
    return-void
.end method

.method private logMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 14
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;
    .param p4, "sender"    # Z
    .param p5, "callId"    # Ljava/lang/String;
    .param p6, "firstLine"    # Ljava/lang/String;
    .param p7, "status"    # Ljava/lang/String;
    .param p8, "tid"    # Ljava/lang/String;
    .param p9, "time"    # J
    .param p11, "timestampVal"    # J

    .line 300
    move-object v0, p0

    iget-object v1, v0, Landroid/gov/nist/javax/sip/stack/ServerLog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iget-object v2, v1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->logRecordFactory:Landroid/gov/nist/javax/sip/LogRecordFactory;

    move-object v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-wide/from16 v6, p9

    move/from16 v8, p4

    move-object/from16 v9, p6

    move-object/from16 v10, p8

    move-object/from16 v11, p5

    move-wide/from16 v12, p11

    invoke-interface/range {v2 .. v13}, Landroid/gov/nist/javax/sip/LogRecordFactory;->createLogRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Landroid/gov/nist/javax/sip/LogRecord;

    move-result-object v1

    .line 302
    .local v1, "log":Landroid/gov/nist/javax/sip/LogRecord;
    if-eqz v1, :cond_0

    .line 303
    invoke-interface {v1}, Landroid/gov/nist/javax/sip/LogRecord;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/stack/ServerLog;->logMessage(Ljava/lang/String;)V

    .line 304
    :cond_0
    return-void
.end method

.method private setProperties(Ljava/util/Properties;)V
    .locals 7
    .param p1, "configurationProperties"    # Ljava/util/Properties;

    .line 94
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    .line 96
    const-string/jumbo v0, "android.javax.sip.STACK_NAME"

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->description:Ljava/lang/String;

    .line 97
    const-string/jumbo v0, "android.javax.sip.IP_ADDRESS"

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackIpAddress:Ljava/lang/String;

    .line 98
    const-string/jumbo v0, "android.gov.nist.javax.sip.SERVER_LOG"

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->logFileName:Ljava/lang/String;

    .line 99
    const-string/jumbo v0, "android.gov.nist.javax.sip.TRACE_LEVEL"

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "logLevel":Ljava/lang/String;
    const-string/jumbo v1, "android.gov.nist.javax.sip.LOG_MESSAGE_CONTENT"

    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "logContent":Ljava/lang/String;
    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string/jumbo v3, "true"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    iput-boolean v3, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->logContent:Z

    .line 105
    if-eqz v0, :cond_7

    .line 106
    const-string v3, "LOG4J"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 107
    sput-boolean v2, Landroid/gov/nist/core/CommonLogger;->useLegacyLogger:Z

    goto :goto_3

    .line 111
    :cond_1
    :try_start_0
    const-string v3, "DEBUG"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 112
    const/16 v3, 0x20

    .local v3, "ll":I
    goto :goto_2

    .line 113
    .end local v3    # "ll":I
    :cond_2
    const-string v3, "INFO"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 114
    const/16 v3, 0x10

    .restart local v3    # "ll":I
    goto :goto_2

    .line 115
    .end local v3    # "ll":I
    :cond_3
    const-string v3, "ERROR"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 116
    const/4 v3, 0x4

    .restart local v3    # "ll":I
    goto :goto_2

    .line 117
    .end local v3    # "ll":I
    :cond_4
    const-string v3, "NONE"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "OFF"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_1

    .line 120
    :cond_5
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .restart local v3    # "ll":I
    goto :goto_2

    .line 118
    .end local v3    # "ll":I
    :cond_6
    :goto_1
    const/4 v3, 0x0

    .line 123
    .restart local v3    # "ll":I
    :goto_2
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/stack/ServerLog;->setTraceLevel(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .end local v3    # "ll":I
    goto :goto_3

    .line 124
    :catch_0
    move-exception v3

    .line 125
    .local v3, "ex":Ljava/lang/NumberFormatException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ServerLog: WARNING Bad integer "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 126
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v5, "logging dislabled "

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 127
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/stack/ServerLog;->setTraceLevel(I)V

    .line 131
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    :cond_7
    :goto_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ServerLog;->checkLogFile()V

    .line 133
    return-void
.end method


# virtual methods
.method public checkLogFile()V
    .locals 20

    .line 155
    move-object/from16 v1, p0

    const-string v0, "\"/>\n "

    const-string v2, "\"\n auxInfo=\""

    const-string/jumbo v3, "android.javax.sip.OUTBOUND_PROXY"

    const-string/jumbo v4, "android.javax.sip.OUTBOUND_PROXY= "

    const-string/jumbo v5, "android.javax.sip.ROUTER_PATH"

    const-string/jumbo v6, "android.javax.sip.ROUTER_PATH= "

    const-string/jumbo v7, "android.javax.sip.STACK_NAME"

    const-string/jumbo v8, "android.javax.sip.IP_ADDRESS"

    const-string v9, "\"\n name=\""

    const-string v10, "<description\n logDescription=\""

    const-string v11, "\n"

    iget-object v12, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->logFileName:Ljava/lang/String;

    if-eqz v12, :cond_6

    iget v12, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->traceLevel:I

    const/16 v13, 0x10

    if-ge v12, v13, :cond_0

    goto/16 :goto_3

    .line 161
    :cond_0
    :try_start_0
    new-instance v12, Ljava/io/File;

    iget-object v13, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->logFileName:Ljava/lang/String;

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 162
    .local v12, "logFile":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_1

    .line 163
    invoke-virtual {v12}, Ljava/io/File;->createNewFile()Z

    .line 164
    const/4 v13, 0x0

    iput-object v13, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    .line 168
    :cond_1
    iget-object v13, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    if-nez v13, :cond_4

    .line 169
    iget-object v13, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    const-string/jumbo v14, "android.gov.nist.javax.sip.SERVER_LOG_OVERWRITE"

    invoke-virtual {v13, v14}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    .line 173
    .local v13, "overwrite":Z
    new-instance v14, Ljava/io/FileWriter;

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->logFileName:Ljava/lang/String;

    move-object/from16 v16, v12

    .end local v12    # "logFile":Ljava/io/File;
    .local v16, "logFile":Ljava/io/File;
    if-nez v13, :cond_2

    const/4 v12, 0x1

    goto :goto_0

    :cond_2
    const/16 v17, 0x0

    move/from16 v12, v17

    :goto_0
    invoke-direct {v14, v15, v12}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    move-object v12, v14

    .line 175
    .local v12, "fw":Ljava/io/FileWriter;
    new-instance v14, Ljava/io/PrintWriter;

    const/4 v15, 0x1

    invoke-direct {v14, v12, v15}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    iput-object v14, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    .line 176
    iget-object v14, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v17, v12

    .end local v12    # "fw":Ljava/io/FileWriter;
    .local v17, "fw":Ljava/io/FileWriter;
    const-string v12, "<!-- Use the  Trace Viewer in src/tools/tracesviewer to view this  trace  \nHere are the stack configuration properties \nandroid.javax.sip.IP_ADDRESS= "

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v15, v8}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v15, "android.javax.sip.STACK_NAME= "

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v15, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v15, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v15, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v15, "-->"

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v14, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 189
    iget-object v12, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->description:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v15, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v14, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->auxInfo:Ljava/lang/String;

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v12, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 193
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->auxInfo:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v12, "<![CDATA[ "

    const-string v14, "<debug>"

    const-string v15, "</debug>"

    move/from16 v18, v13

    .end local v13    # "overwrite":Z
    .local v18, "overwrite":Z
    const/16 v13, 0x20

    if-eqz v7, :cond_3

    .line 195
    :try_start_1
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v7, v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isLoggingEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 196
    iget-object v7, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v12

    const-string v12, "Here are the stack configuration properties \nandroid.javax.sip.IP_ADDRESS= "

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v13, v8}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v8, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v5, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "android.gov.nist.javax.sip.CACHE_CLIENT_CONNECTIONS= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    const-string/jumbo v5, "android.gov.nist.javax.sip.CACHE_CLIENT_CONNECTIONS"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "android.gov.nist.javax.sip.CACHE_SERVER_CONNECTIONS= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    const-string/jumbo v5, "android.gov.nist.javax.sip.CACHE_SERVER_CONNECTIONS"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "android.gov.nist.javax.sip.REENTRANT_LISTENER= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    const-string/jumbo v5, "android.gov.nist.javax.sip.REENTRANT_LISTENER"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "android.gov.nist.javax.sip.THREAD_POOL_SIZE= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    const-string/jumbo v5, "android.gov.nist.javax.sip.THREAD_POOL_SIZE"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v7, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 225
    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    const-string v4, " ]]> "

    invoke-interface {v3, v4}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 226
    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v3, v15}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 227
    iget-object v3, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->description:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackIpAddress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->auxInfo:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 230
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 231
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    move-object/from16 v2, v19

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    goto :goto_1

    .line 235
    :cond_3
    move-object v2, v12

    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0, v13}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 236
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Here are the stack configuration properties \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->configurationProperties:Ljava/util/Properties;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 238
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    const-string v3, " ]]>"

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 239
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v15}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 240
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackIpAddress:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" />\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 242
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v14}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 243
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    invoke-interface {v0, v2}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 168
    .end local v16    # "logFile":Ljava/io/File;
    .end local v17    # "fw":Ljava/io/FileWriter;
    .end local v18    # "overwrite":Z
    .local v12, "logFile":Ljava/io/File;
    :cond_4
    move-object/from16 v16, v12

    .line 249
    .end local v12    # "logFile":Ljava/io/File;
    :cond_5
    :goto_1
    goto :goto_2

    .line 247
    :catch_0
    move-exception v0

    .line 250
    :goto_2
    return-void

    .line 158
    :cond_6
    :goto_3
    return-void
.end method

.method public declared-synchronized closeLogFile()V
    .locals 1

    monitor-enter p0

    .line 148
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    .end local p0    # "this":Landroid/gov/nist/javax/sip/stack/ServerLog;
    :cond_0
    monitor-exit p0

    return-void

    .line 147
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getLogFileName()Ljava/lang/String;
    .locals 1

    .line 275
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->logFileName:Ljava/lang/String;

    return-object v0
.end method

.method public getTraceLevel()I
    .locals 1

    .line 410
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->traceLevel:I

    return v0
.end method

.method public logException(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "ex"    # Ljava/lang/Exception;

    .line 378
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->traceLevel:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 379
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/ServerLog;->checkLogFile()V

    .line 380
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 381
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    if-eqz v0, :cond_0

    .line 382
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->printWriter:Ljava/io/PrintWriter;

    invoke-virtual {p1, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 385
    :cond_0
    return-void
.end method

.method public logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8
    .param p1, "message"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;
    .param p4, "status"    # Ljava/lang/String;
    .param p5, "sender"    # Z

    .line 368
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v7}, Landroid/gov/nist/javax/sip/stack/ServerLog;->logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 369
    return-void
.end method

.method public logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 19
    .param p1, "message"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;
    .param p4, "status"    # Ljava/lang/String;
    .param p5, "sender"    # Z
    .param p6, "time"    # J

    .line 343
    move-object/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ServerLog;->checkLogFile()V

    .line 344
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/CallID;

    .line 345
    .local v1, "cid":Landroid/gov/nist/javax/sip/header/CallID;
    const/4 v2, 0x0

    .line 346
    .local v2, "callId":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 347
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v2

    .line 348
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFirstLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    .line 349
    .local v16, "firstLine":Ljava/lang/String;
    move-object/from16 v12, p0

    iget-boolean v3, v12, Landroid/gov/nist/javax/sip/stack/ServerLog;->logContent:Z

    if-eqz v3, :cond_1

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeMessage(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_0
    move-object v4, v3

    .line 350
    .local v4, "encoded":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v17

    .line 351
    .local v17, "tid":Ljava/lang/String;
    const-string/jumbo v3, "Timestamp"

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v3

    move-object/from16 v18, v3

    check-cast v18, Landroid/javax/sip/header/TimeStampHeader;

    .line 352
    .local v18, "tshdr":Landroid/javax/sip/header/TimeStampHeader;
    if-nez v18, :cond_2

    const-wide/16 v5, 0x0

    goto :goto_1

    :cond_2
    invoke-interface/range {v18 .. v18}, Landroid/javax/sip/header/TimeStampHeader;->getTime()J

    move-result-wide v5

    :goto_1
    move-wide v14, v5

    .line 353
    .local v14, "tsval":J
    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p5

    move-object v8, v2

    move-object/from16 v9, v16

    move-object/from16 v10, p4

    move-object/from16 v11, v17

    move-wide/from16 v12, p6

    invoke-direct/range {v3 .. v15}, Landroid/gov/nist/javax/sip/stack/ServerLog;->logMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 354
    return-void
.end method

.method public logMessage(Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 19
    .param p1, "message"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;
    .param p4, "sender"    # Z
    .param p5, "time"    # J

    .line 316
    move-object/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/stack/ServerLog;->checkLogFile()V

    .line 317
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFirstLine()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 318
    return-void

    .line 319
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/CallID;

    .line 320
    .local v1, "cid":Landroid/gov/nist/javax/sip/header/CallID;
    const/4 v2, 0x0

    .line 321
    .local v2, "callId":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 322
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/CallID;->getCallId()Ljava/lang/String;

    move-result-object v2

    .line 323
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getFirstLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    .line 324
    .local v16, "firstLine":Ljava/lang/String;
    move-object/from16 v12, p0

    iget-boolean v3, v12, Landroid/gov/nist/javax/sip/stack/ServerLog;->logContent:Z

    if-eqz v3, :cond_2

    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeMessage(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_0
    move-object v4, v3

    .line 325
    .local v4, "inputText":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getTransactionId()Ljava/lang/String;

    move-result-object v17

    .line 326
    .local v17, "tid":Ljava/lang/String;
    const-string/jumbo v3, "Timestamp"

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getHeader(Ljava/lang/String;)Landroid/javax/sip/header/Header;

    move-result-object v3

    move-object/from16 v18, v3

    check-cast v18, Landroid/javax/sip/header/TimeStampHeader;

    .line 327
    .local v18, "tsHdr":Landroid/javax/sip/header/TimeStampHeader;
    if-nez v18, :cond_3

    const-wide/16 v5, 0x0

    goto :goto_1

    :cond_3
    invoke-interface/range {v18 .. v18}, Landroid/javax/sip/header/TimeStampHeader;->getTime()J

    move-result-wide v5

    :goto_1
    move-wide v14, v5

    .line 328
    .local v14, "tsval":J
    const/4 v10, 0x0

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    move-object v8, v2

    move-object/from16 v9, v16

    move-object/from16 v11, v17

    move-wide/from16 v12, p5

    invoke-direct/range {v3 .. v15}, Landroid/gov/nist/javax/sip/stack/ServerLog;->logMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 329
    return-void
.end method

.method public needsLogging()Z
    .locals 1

    .line 259
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->logFileName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setAuxInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "auxInfo"    # Ljava/lang/String;

    .line 420
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->auxInfo:Ljava/lang/String;

    .line 421
    return-void
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "jsipLoggingLevel"    # I

    .line 438
    return-void
.end method

.method public setLogFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 268
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->logFileName:Ljava/lang/String;

    .line 269
    return-void
.end method

.method public setSipStack(Landroid/javax/sip/SipStack;)V
    .locals 2
    .param p1, "sipStack"    # Landroid/javax/sip/SipStack;

    .line 424
    instance-of v0, p1, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    if-eqz v0, :cond_0

    .line 425
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    .line 426
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->sipStack:Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/SIPTransactionStack;->getStackLogger()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackLogger:Landroid/gov/nist/core/StackLogger;

    .line 430
    return-void

    .line 429
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "sipStack must be a SIPTransactionStack"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setStackIpAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "ipAddress"    # Ljava/lang/String;

    .line 136
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->stackIpAddress:Ljava/lang/String;

    .line 137
    return-void
.end method

.method public setStackProperties(Ljava/util/Properties;)V
    .locals 0
    .param p1, "stackProperties"    # Ljava/util/Properties;

    .line 433
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/stack/ServerLog;->setProperties(Ljava/util/Properties;)V

    .line 434
    return-void
.end method

.method public setTraceLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .line 401
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/ServerLog;->traceLevel:I

    .line 402
    return-void
.end method
