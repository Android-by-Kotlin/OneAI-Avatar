.class public Landroid/gov/nist/javax/sip/stack/CallAnalyzer$StackTrace;
.super Ljava/lang/Object;
.source "CallAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/CallAnalyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StackTrace"
.end annotation


# instance fields
.field public delta:I

.field public trace:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "delta"    # I
    .param p2, "trace"    # Ljava/lang/String;

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    iput p1, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$StackTrace;->delta:I

    .line 180
    iput-object p2, p0, Landroid/gov/nist/javax/sip/stack/CallAnalyzer$StackTrace;->trace:Ljava/lang/String;

    .line 181
    return-void
.end method
