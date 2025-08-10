.class public final Landroid/javax/sip/TransactionState;
.super Ljava/lang/Object;
.source "TransactionState.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final CALLING:Landroid/javax/sip/TransactionState;

.field public static final COMPLETED:Landroid/javax/sip/TransactionState;

.field public static final CONFIRMED:Landroid/javax/sip/TransactionState;

.field public static final PROCEEDING:Landroid/javax/sip/TransactionState;

.field public static final TERMINATED:Landroid/javax/sip/TransactionState;

.field public static final TRYING:Landroid/javax/sip/TransactionState;

.field public static final _CALLING:I = 0x0

.field public static final _COMPLETED:I = 0x3

.field public static final _CONFIRMED:I = 0x4

.field public static final _PROCEEDING:I = 0x2

.field public static final _TERMINATED:I = 0x5

.field public static final _TRYING:I = 0x1

.field private static m_size:I

.field private static m_transStateArray:[Landroid/javax/sip/TransactionState;


# instance fields
.field private m_transactionState:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 408
    const/4 v0, 0x6

    sput v0, Landroid/javax/sip/TransactionState;->m_size:I

    .line 409
    sget v0, Landroid/javax/sip/TransactionState;->m_size:I

    new-array v0, v0, [Landroid/javax/sip/TransactionState;

    sput-object v0, Landroid/javax/sip/TransactionState;->m_transStateArray:[Landroid/javax/sip/TransactionState;

    .line 419
    new-instance v0, Landroid/javax/sip/TransactionState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/TransactionState;->CALLING:Landroid/javax/sip/TransactionState;

    .line 429
    new-instance v0, Landroid/javax/sip/TransactionState;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/TransactionState;->TRYING:Landroid/javax/sip/TransactionState;

    .line 440
    new-instance v0, Landroid/javax/sip/TransactionState;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/TransactionState;->PROCEEDING:Landroid/javax/sip/TransactionState;

    .line 451
    new-instance v0, Landroid/javax/sip/TransactionState;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/TransactionState;->COMPLETED:Landroid/javax/sip/TransactionState;

    .line 463
    new-instance v0, Landroid/javax/sip/TransactionState;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/TransactionState;->CONFIRMED:Landroid/javax/sip/TransactionState;

    .line 474
    new-instance v0, Landroid/javax/sip/TransactionState;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/javax/sip/TransactionState;-><init>(I)V

    sput-object v0, Landroid/javax/sip/TransactionState;->TERMINATED:Landroid/javax/sip/TransactionState;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 2
    .param p1, "transactionState"    # I

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    iput p1, p0, Landroid/javax/sip/TransactionState;->m_transactionState:I

    .line 236
    sget-object v0, Landroid/javax/sip/TransactionState;->m_transStateArray:[Landroid/javax/sip/TransactionState;

    iget v1, p0, Landroid/javax/sip/TransactionState;->m_transactionState:I

    aput-object p0, v0, v1

    .line 238
    return-void
.end method

.method public static getObject(I)Landroid/javax/sip/TransactionState;
    .locals 2
    .param p0, "transactionState"    # I

    .line 256
    if-ltz p0, :cond_0

    sget v0, Landroid/javax/sip/TransactionState;->m_size:I

    if-ge p0, v0, :cond_0

    .line 258
    sget-object v0, Landroid/javax/sip/TransactionState;->m_transStateArray:[Landroid/javax/sip/TransactionState;

    aget-object v0, v0, p0

    return-object v0

    .line 262
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid transactionState value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .line 314
    sget-object v0, Landroid/javax/sip/TransactionState;->m_transStateArray:[Landroid/javax/sip/TransactionState;

    iget v1, p0, Landroid/javax/sip/TransactionState;->m_transactionState:I

    aget-object v0, v0, v1

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 329
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 331
    :cond_0
    instance-of v1, p1, Landroid/javax/sip/TransactionState;

    if-eqz v1, :cond_1

    move-object v1, p1

    check-cast v1, Landroid/javax/sip/TransactionState;

    iget v1, v1, Landroid/javax/sip/TransactionState;->m_transactionState:I

    iget v2, p0, Landroid/javax/sip/TransactionState;->m_transactionState:I

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getValue()I
    .locals 1

    .line 282
    iget v0, p0, Landroid/javax/sip/TransactionState;->m_transactionState:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 341
    iget v0, p0, Landroid/javax/sip/TransactionState;->m_transactionState:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 353
    const-string v0, ""

    .line 355
    .local v0, "text":Ljava/lang/String;
    iget v1, p0, Landroid/javax/sip/TransactionState;->m_transactionState:I

    packed-switch v1, :pswitch_data_0

    .line 395
    const-string v0, "Error while printing Transaction State"

    goto :goto_0

    .line 389
    :pswitch_0
    const-string/jumbo v0, "Terminated Transaction"

    .line 391
    goto :goto_0

    .line 383
    :pswitch_1
    const-string v0, "Confirmed Transaction"

    .line 385
    goto :goto_0

    .line 377
    :pswitch_2
    const-string v0, "Completed Transaction"

    .line 379
    goto :goto_0

    .line 371
    :pswitch_3
    const-string/jumbo v0, "Proceeding Transaction"

    .line 373
    goto :goto_0

    .line 365
    :pswitch_4
    const-string/jumbo v0, "Trying Transaction"

    .line 367
    goto :goto_0

    .line 359
    :pswitch_5
    const-string v0, "Calling Transaction"

    .line 361
    nop

    .line 401
    :goto_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
