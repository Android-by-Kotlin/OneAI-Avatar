.class Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;
.super Ljava/util/TimerTask;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->startAnalysis(Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

.field final synthetic val$metricReference:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

.field final synthetic val$statInfo:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;


# direct methods
.method constructor <init>(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;)V
    .locals 0

    .line 229
    iput-object p1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->this$0:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->val$statInfo:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    iput-object p3, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->val$metricReference:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 21

    .line 233
    move-object/from16 v1, p0

    :try_start_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->val$statInfo:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    iget-object v0, v0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->lastLoggedEventTime:Ljava/lang/Long;

    .line 236
    .local v0, "lastDump":Ljava/lang/Long;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget-object v4, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->val$statInfo:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->config:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    iget-object v4, v4, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->minimumDumpInterval:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_7

    .line 239
    iget-object v2, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->this$0:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    invoke-static {v2}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->access$000(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 240
    .local v2, "threadInfos":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Thread;Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;>;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 241
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 242
    .local v3, "info":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Thread;Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->val$metricReference:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    .line 243
    .local v4, "entryTime":Ljava/lang/Long;
    const-wide/high16 v5, -0x8000000000000000L

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 244
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    sub-long/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 247
    .local v7, "delta":Ljava/lang/Long;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v8

    if-eqz v8, :cond_4

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iget-object v10, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->val$statInfo:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;

    iget-object v10, v10, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$TImeMetricInfo;->config:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;

    iget-object v10, v10, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricAnalysisConfiguration;->stuckTimeBeforeDump:Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-lez v8, :cond_4

    .line 248
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Offending thread:\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->this$0:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Thread;

    invoke-virtual {v10, v11}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getCurrentStack(Ljava/lang/Thread;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V

    .line 250
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    .local v8, "sb":Ljava/lang/StringBuilder;
    const/16 v9, 0x1388

    new-array v9, v9, [Ljava/lang/Thread;

    .line 252
    .local v9, "threads":[Ljava/lang/Thread;
    invoke-static {v9}, Ljava/lang/Thread;->enumerate([Ljava/lang/Thread;)I

    move-result v10

    .line 253
    .local v10, "count":I
    const/4 v11, 0x0

    .local v11, "q":I
    :goto_1
    if-ge v11, v10, :cond_3

    .line 254
    const-wide/16 v12, 0x0

    .line 255
    .local v12, "threadStuck":J
    iget-object v14, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->this$0:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    invoke-static {v14}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->access$000(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;)Ljava/util/Map;

    move-result-object v14

    aget-object v15, v9, v11

    invoke-interface {v14, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/HashMap;

    .line 256
    .local v14, "subInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;"
    if-eqz v14, :cond_2

    .line 257
    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->this$0:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    invoke-static {v15}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->access$000(Landroid/gov/nist/javax/sip/stack/CallAnalyzer;)Ljava/util/Map;

    move-result-object v15

    aget-object v5, v9, v11

    invoke-interface {v15, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    iget-object v6, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->val$metricReference:Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    .line 258
    .local v5, "stamp":Ljava/lang/Long;
    if-eqz v5, :cond_0

    .line 259
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    sub-long v12, v17, v19

    .line 261
    :cond_0
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v17

    const-wide/high16 v15, -0x8000000000000000L

    cmp-long v6, v17, v15

    if-eqz v6, :cond_1

    .line 262
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "->Stuck time:"

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v15, " "

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v15, v1, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$1;->this$0:Landroid/gov/nist/javax/sip/stack/CallAnalyzer;

    move-object/from16 v16, v0

    .end local v0    # "lastDump":Ljava/lang/Long;
    .local v16, "lastDump":Ljava/lang/Long;
    aget-object v0, v9, v11

    invoke-virtual {v15, v0}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->getCurrentStack(Ljava/lang/Thread;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 261
    .end local v16    # "lastDump":Ljava/lang/Long;
    .restart local v0    # "lastDump":Ljava/lang/Long;
    :cond_1
    move-object/from16 v16, v0

    .end local v0    # "lastDump":Ljava/lang/Long;
    .restart local v16    # "lastDump":Ljava/lang/Long;
    goto :goto_2

    .line 256
    .end local v5    # "stamp":Ljava/lang/Long;
    .end local v16    # "lastDump":Ljava/lang/Long;
    .restart local v0    # "lastDump":Ljava/lang/Long;
    :cond_2
    move-object/from16 v16, v0

    .line 253
    .end local v0    # "lastDump":Ljava/lang/Long;
    .end local v12    # "threadStuck":J
    .end local v14    # "subInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;"
    .restart local v16    # "lastDump":Ljava/lang/Long;
    :goto_2
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, v16

    const-wide/high16 v5, -0x8000000000000000L

    goto :goto_1

    .end local v16    # "lastDump":Ljava/lang/Long;
    .restart local v0    # "lastDump":Ljava/lang/Long;
    :cond_3
    move-object/from16 v16, v0

    .line 266
    .end local v0    # "lastDump":Ljava/lang/Long;
    .end local v11    # "q":I
    .restart local v16    # "lastDump":Ljava/lang/Long;
    invoke-static {}, Landroid/gov/nist/javax/sip/stack/CallAnalyzer;->access$100()Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Landroid/gov/nist/core/StackLogger;->logWarning(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    const/4 v0, 0x0

    .line 268
    .end local v9    # "threads":[Ljava/lang/Thread;
    .local v0, "threads":[Ljava/lang/Thread;
    goto :goto_4

    .line 247
    .end local v8    # "sb":Ljava/lang/StringBuilder;
    .end local v10    # "count":I
    .end local v16    # "lastDump":Ljava/lang/Long;
    .local v0, "lastDump":Ljava/lang/Long;
    :cond_4
    move-object/from16 v16, v0

    .end local v0    # "lastDump":Ljava/lang/Long;
    .restart local v16    # "lastDump":Ljava/lang/Long;
    goto :goto_3

    .line 243
    .end local v7    # "delta":Ljava/lang/Long;
    .end local v16    # "lastDump":Ljava/lang/Long;
    .restart local v0    # "lastDump":Ljava/lang/Long;
    :cond_5
    move-object/from16 v16, v0

    .line 271
    .end local v0    # "lastDump":Ljava/lang/Long;
    .end local v3    # "info":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Thread;Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;>;"
    .end local v4    # "entryTime":Ljava/lang/Long;
    .restart local v16    # "lastDump":Ljava/lang/Long;
    :goto_3
    move-object/from16 v0, v16

    goto/16 :goto_0

    .line 240
    .end local v16    # "lastDump":Ljava/lang/Long;
    .restart local v0    # "lastDump":Ljava/lang/Long;
    :cond_6
    move-object/from16 v16, v0

    .end local v0    # "lastDump":Ljava/lang/Long;
    .restart local v16    # "lastDump":Ljava/lang/Long;
    goto :goto_4

    .line 236
    .end local v2    # "threadInfos":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Thread;Ljava/util/HashMap<Landroid/gov/nist/javax/sip/stack/CallAnalyzer$MetricReference;Ljava/lang/Object;>;>;>;"
    .end local v16    # "lastDump":Ljava/lang/Long;
    .restart local v0    # "lastDump":Ljava/lang/Long;
    :cond_7
    move-object/from16 v16, v0

    .line 275
    .end local v0    # "lastDump":Ljava/lang/Long;
    :goto_4
    goto :goto_5

    .line 273
    :catch_0
    move-exception v0

    .line 275
    :goto_5
    return-void
.end method
