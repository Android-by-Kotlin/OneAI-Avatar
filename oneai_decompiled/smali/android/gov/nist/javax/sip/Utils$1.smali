.class final Landroid/gov/nist/javax/sip/Utils$1;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/gov/nist/javax/sip/Utils;->main([Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$branchIds:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Ljava/util/HashSet;)V
    .locals 0

    .line 221
    iput-object p1, p0, Landroid/gov/nist/javax/sip/Utils$1;->val$branchIds:Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 225
    const/4 v0, 0x0

    .local v0, "b":I
    :goto_0
    const v1, 0xf4240

    if-ge v0, v1, :cond_1

    .line 226
    invoke-static {}, Landroid/gov/nist/javax/sip/Utils;->getInstance()Landroid/gov/nist/javax/sip/Utils;

    move-result-object v1

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/Utils;->generateBranchId()Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, "bid":Ljava/lang/String;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/Utils$1;->val$branchIds:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 230
    iget-object v2, p0, Landroid/gov/nist/javax/sip/Utils$1;->val$branchIds:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 225
    .end local v1    # "bid":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 228
    .restart local v1    # "bid":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Duplicate Branch ID"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 233
    .end local v0    # "b":I
    .end local v1    # "bid":Ljava/lang/String;
    :cond_1
    return-void
.end method
