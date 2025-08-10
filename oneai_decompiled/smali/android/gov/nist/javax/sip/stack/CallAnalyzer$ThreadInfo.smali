.class public Landroid/gov/nist/javax/sip/stack/CallAnalyzer$ThreadInfo;
.super Ljava/lang/Object;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThreadInfo"
.end annotation


# instance fields
.field public data:Ljava/lang/Object;

.field public stackTraces:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/gov/nist/javax/sip/stack/CallAnalyzer$StackTrace;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$ThreadInfo;->stackTraces:Ljava/util/LinkedList;

    return-void
.end method
