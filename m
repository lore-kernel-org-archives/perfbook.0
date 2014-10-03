Return-Path: <wrl@illest.net>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=	messagingengine.com;
 h=message-id:x-sasl-enc:from:to:cc
 :mime-version:content-transfer-encoding:content-type:subject
 :date:in-reply-to:references; s=smtpout; bh=IMdUNK/PXwq70+DHJ44h	rjUlyr4=;
 b=cnz4yw9g8gpJTc3OTGKVfrA+ZNKI0f9k4hGdTcd2V9G55tJBglTh
 23CTXp8RSXtAkh5N4u4iElL9r7dwhnDuWzvaRDpeAj3i5q3meKAgcd6YOlV2R9W4
 DiIwWHDW5KFi2PCE3DDcgmyiRd8FNOgFiQD8uSdt8IbcvdgM11o8tGQ=
Message-Id: 
 <1412314107.4191327.174652477.71409BD5@webmail.messagingengine.com>
From: William Light <wrl@illest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Subject: Re: Trouble building PDF on Arch
Date: Fri, 03 Oct 2014 07:28:27 +0200
In-Reply-To: <20141002201340.GX5015@linux.vnet.ibm.com>
References: 
 <1411745065.4175076.172118541.1DB2821F@webmail.messagingengine.com>
 <20141002201340.GX5015@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Paul,

It turned out to be a LaTex bug, actually! More information here:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=752773

Norbert Preining's fix worked for me.

-w

On Thu, 2 Oct 2014, at 22:13, Paul E. McKenney wrote:
> On Fri, Sep 26, 2014 at 05:24:25PM +0200, William Light wrote:
> > Hey everyone,
> > 
> > I'm trying to build the perfbook PDF from a git clone, but latex keeps
> > exiting with a fatal error. I've installed just about everything
> > texlive-related (there's a catch-all package called texlive-most).
> > 
> > Here's the log:
> > http://illest.net/~will/perfbook.log.txt
> 
> Hmmmm...  Works for me.  (Famous last words!)
> 
> The table that it is complaining about should look as shown below.
> If not, please revert back to the original.  If it does, please try
> deleting it as a diagnostic measure.
> 
> What environment are you building in?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> \begin{table*}
> \scriptsize
> \begin{center}
> \begin{tabular}{l|l|l}
> 	Category & POSIX & Linux Kernel \\
> 	\hline
> 	\hline
> 	Thread Management
> 		& \co{pthread_t}
> 			& \co{struct task_struct} \\
> 	\cline{2-3}
> 		& \co{pthread_create()}
> 			& \co{kthread_create} \\
> 	\cline{2-3}
> 		& \co{pthread_exit()}
> 			& \co{kthread_should_stop()}~~~~~(rough) \\
> 	\cline{2-3}
> 		& \co{pthread_join()}
> 			& \co{kthread_stop()}~~~(rough) \\
> 	\cline{2-3}
> 		& \co{poll(NULL, 0, 5)}
> 			& \co{schedule_timeout_interruptible()} ~~~ \\
> 	\hline
> 	\hline
> 	POSIX Locking
> 		& \co{pthread_mutex_t}
> 			& \co{spinlock_t}~~~(rough) \\
> 		&	& \co{struct mutex} \\
> 	\cline{2-3}
> 		& \co{PTHREAD_MUTEX_INITIALIZER}
> 			& \co{DEFINE_SPINLOCK()} \\
> 		&	& \co{DEFINE_MUTEX()} \\
> 	\cline{2-3}
> 		& \co{pthread_mutex_lock()}
> 			& \co{spin_lock()}~~~(and friends) \\
> 		&	& \co{mutex_lock()}~~~(and friends) \\
> 	\cline{2-3}
> 		& \co{pthread_mutex_unlock()}
> 			& \co{spin_unlock()}~~~(and friends) \\
> 		&	& \co{mutex_unlock()} \\
> 	\hline
> 	\hline
> 	POSIX Reader-Writer
> 		& \co{pthread_rwlock_t}
> 			& \co{rwlock_t}~~~(rough) \\
> 	Locking	&	& \co{struct rw_semaphore} \\
> 	\cline{2-3}
> 		& \co{PTHREAD_RWLOCK_INITIALIZER}
> 			& \co{DEFINE_RWLOCK()} \\
> 		&	& \co{DECLARE_RWSEM()} \\
> 	\cline{2-3}
> 		& \co{pthread_rwlock_rdlock()}
> 			& \co{read_lock()}~~~(and friends) \\
> 		&	& \co{down_read()}~~~(and friends) \\
> 	\cline{2-3}
> 		& \co{pthread_rwlock_unlock()}
> 			& \co{read_unlock()}~~~(and friends) \\
> 		&	& \co{up_read()} \\
> 	\cline{2-3}
> 		& \co{pthread_rwlock_wrlock()}
> 			& \co{write_lock()}~~~(and friends) \\
> 		&	& \co{down_write()}~~~(and friends) \\
> 	\cline{2-3}
> 		& \co{pthread_rwlock_unlock()}
> 			& \co{write_unlock()}~~~(and friends) \\
> 		&	& \co{up_write()} \\
> 	\hline
> 	\hline
> 	Atomic Operations
> 		& C Scalar Types
> 			& \co{atomic_t} \\
> 		&	& \co{atomic64_t} \\
> 	\cline{2-3}
> 		& \co{__sync_fetch_and_add()}
> 			& \co{atomic_add_return()} \\
> 		&	& \co{atomic64_add_return()} \\
> 	\cline{2-3}
> 		& \co{__sync_fetch_and_sub()}
> 			& \co{atomic_sub_return()} \\
> 		&	& \co{atomic64_sub_return()} \\
> 	\cline{2-3}
> 		& \co{__sync_val_compare_and_swap()} ~~~~~~~~~~
> 			& \co{cmpxchg()} \\
> 	\cline{2-3}
> 		& \co{__sync_lock_test_and_set()}
> 			& \co{xchg()}~~~(rough) \\
> 	\cline{2-3}
> 		& \co{__sync_synchronize()}
> 			& \co{smp_mb()} \\
> \end{tabular}
> \end{center}
> \caption{Mapping from POSIX to Linux-Kernel Primitives}
> \label{tab:advsync:Mapping from POSIX to Linux-Kernel Primitives}
> \end{table*}
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

