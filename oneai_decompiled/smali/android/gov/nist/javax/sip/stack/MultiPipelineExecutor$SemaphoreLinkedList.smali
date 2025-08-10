.class public Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;
.super Ljava/util/LinkedList;
.source "MultiPipelineExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SemaphoreLinkedList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/LinkedList<",
        "TA;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field semaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 78
    .local p0, "this":Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;, "Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList<TA;>;"
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 80
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/MultiPipelineExecutor$SemaphoreLinkedList;->semaphore:Ljava/util/concurrent/Semaphore;

    return-void
.end method
