.class public final enum Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;
.super Ljava/lang/Enum;
.source "IllegalTransactionStateException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Reason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

.field public static final enum ContactHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

.field public static final enum ExpiresHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

.field public static final enum GenericReason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

.field public static final enum MissingRequiredHeader:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

.field public static final enum RequestAlreadySent:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

.field public static final enum UnmatchingCSeq:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 39
    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    const-string/jumbo v1, "RequestAlreadySent"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->RequestAlreadySent:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    const-string v1, "MissingRequiredHeader"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->MissingRequiredHeader:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    const-string/jumbo v1, "UnmatchingCSeq"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->UnmatchingCSeq:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    const-string v1, "ExpiresHeaderMandatory"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->ExpiresHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    const-string v1, "ContactHeaderMandatory"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->ContactHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    new-instance v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    const-string v1, "GenericReason"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->GenericReason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    .line 38
    sget-object v3, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->RequestAlreadySent:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    sget-object v4, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->MissingRequiredHeader:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    sget-object v5, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->UnmatchingCSeq:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    sget-object v6, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->ExpiresHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    sget-object v7, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->ContactHeaderMandatory:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    sget-object v8, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->GenericReason:Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    filled-new-array/range {v3 .. v8}, [Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->$VALUES:[Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 38
    const-class v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    return-object v0
.end method

.method public static values()[Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;
    .locals 1

    .line 38
    sget-object v0, Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->$VALUES:[Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    invoke-virtual {v0}, [Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/gov/nist/javax/sip/stack/IllegalTransactionStateException$Reason;

    return-object v0
.end method
