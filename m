Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e32.co.us.ibm.com ([32.97.110.150]:41760 "EHLO
 e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751112AbaJDIKb (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 4 Oct 2014
 04:10:31 -0400
Received: from /spool/local	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 4 Oct 2014
 02:10:31 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 691103E40044	for <perfbook@vger.kernel.org>; Sat, 4
 Oct 2014 02:10:28 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com
 [9.17.195.245])	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id s948ASHa50528358	for <perfbook@vger.kernel.org>; Sat, 4 Oct
 2014 10:10:28 +0200
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 s948F4OH032714	for <perfbook@vger.kernel.org>; Sat, 4 Oct 2014 02:15:04 -0600
Date: Sat, 4 Oct 2014 01:10:18 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Trouble building PDF on Arch
Message-ID: <20141004081018.GE5015@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <1411745065.4175076.172118541.1DB2821F@webmail.messagingengine.com>
 <20141002201340.GX5015@linux.vnet.ibm.com>
 <1412314107.4191327.174652477.71409BD5@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <1412314107.4191327.174652477.71409BD5@webmail.messagingengine.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: William Light <wrl@illest.net>
Cc: perfbook@vger.kernel.org

On Fri, Oct 03, 2014 at 07:28:27AM +0200, William Light wrote:
> Paul,
> 
> It turned out to be a LaTex bug, actually! More information here:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=752773
> 
> Norbert Preining's fix worked for me.

Good to hear that it was fixed!

							Thanx, Paul

> -w
> 
> On Thu, 2 Oct 2014, at 22:13, Paul E. McKenney wrote:
> > On Fri, Sep 26, 2014 at 05:24:25PM +0200, William Light wrote:
> > > Hey everyone,
> > > 
> > > I'm trying to build the perfbook PDF from a git clone, but latex keeps
> > > exiting with a fatal error. I've installed just about everything
> > > texlive-related (there's a catch-all package called texlive-most).
> > > 
> > > Here's the log:
> > > http://illest.net/~will/perfbook.log.txt
> > 
> > Hmmmm...  Works for me.  (Famous last words!)
> > 
> > The table that it is complaining about should look as shown below.
> > If not, please revert back to the original.  If it does, please try
> > deleting it as a diagnostic measure.
> > 
> > What environment are you building in?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > \begin{table*}
> > \scriptsize
> > \begin{center}
> > \begin{tabular}{l|l|l}
> > 	Category & POSIX & Linux Kernel \\
> > 	\hline
> > 	\hline
> > 	Thread Management
> > 		& \co{pthread_t}
> > 			& \co{struct task_struct} \\
> > 	\cline{2-3}
> > 		& \co{pthread_create()}
> > 			& \co{kthread_create} \\
> > 	\cline{2-3}
> > 		& \co{pthread_exit()}
> > 			& \co{kthread_should_stop()}~~~~~(rough) \\
> > 	\cline{2-3}
> > 		& \co{pthread_join()}
> > 			& \co{kthread_stop()}~~~(rough) \\
> > 	\cline{2-3}
> > 		& \co{poll(NULL, 0, 5)}
> > 			& \co{schedule_timeout_interruptible()} ~~~ \\
> > 	\hline
> > 	\hline
> > 	POSIX Locking
> > 		& \co{pthread_mutex_t}
> > 			& \co{spinlock_t}~~~(rough) \\
> > 		&	& \co{struct mutex} \\
> > 	\cline{2-3}
> > 		& \co{PTHREAD_MUTEX_INITIALIZER}
> > 			& \co{DEFINE_SPINLOCK()} \\
> > 		&	& \co{DEFINE_MUTEX()} \\
> > 	\cline{2-3}
> > 		& \co{pthread_mutex_lock()}
> > 			& \co{spin_lock()}~~~(and friends) \\
> > 		&	& \co{mutex_lock()}~~~(and friends) \\
> > 	\cline{2-3}
> > 		& \co{pthread_mutex_unlock()}
> > 			& \co{spin_unlock()}~~~(and friends) \\
> > 		&	& \co{mutex_unlock()} \\
> > 	\hline
> > 	\hline
> > 	POSIX Reader-Writer
> > 		& \co{pthread_rwlock_t}
> > 			& \co{rwlock_t}~~~(rough) \\
> > 	Locking	&	& \co{struct rw_semaphore} \\
> > 	\cline{2-3}
> > 		& \co{PTHREAD_RWLOCK_INITIALIZER}
> > 			& \co{DEFINE_RWLOCK()} \\
> > 		&	& \co{DECLARE_RWSEM()} \\
> > 	\cline{2-3}
> > 		& \co{pthread_rwlock_rdlock()}
> > 			& \co{read_lock()}~~~(and friends) \\
> > 		&	& \co{down_read()}~~~(and friends) \\
> > 	\cline{2-3}
> > 		& \co{pthread_rwlock_unlock()}
> > 			& \co{read_unlock()}~~~(and friends) \\
> > 		&	& \co{up_read()} \\
> > 	\cline{2-3}
> > 		& \co{pthread_rwlock_wrlock()}
> > 			& \co{write_lock()}~~~(and friends) \\
> > 		&	& \co{down_write()}~~~(and friends) \\
> > 	\cline{2-3}
> > 		& \co{pthread_rwlock_unlock()}
> > 			& \co{write_unlock()}~~~(and friends) \\
> > 		&	& \co{up_write()} \\
> > 	\hline
> > 	\hline
> > 	Atomic Operations
> > 		& C Scalar Types
> > 			& \co{atomic_t} \\
> > 		&	& \co{atomic64_t} \\
> > 	\cline{2-3}
> > 		& \co{__sync_fetch_and_add()}
> > 			& \co{atomic_add_return()} \\
> > 		&	& \co{atomic64_add_return()} \\
> > 	\cline{2-3}
> > 		& \co{__sync_fetch_and_sub()}
> > 			& \co{atomic_sub_return()} \\
> > 		&	& \co{atomic64_sub_return()} \\
> > 	\cline{2-3}
> > 		& \co{__sync_val_compare_and_swap()} ~~~~~~~~~~
> > 			& \co{cmpxchg()} \\
> > 	\cline{2-3}
> > 		& \co{__sync_lock_test_and_set()}
> > 			& \co{xchg()}~~~(rough) \\
> > 	\cline{2-3}
> > 		& \co{__sync_synchronize()}
> > 			& \co{smp_mb()} \\
> > \end{tabular}
> > \end{center}
> > \caption{Mapping from POSIX to Linux-Kernel Primitives}
> > \label{tab:advsync:Mapping from POSIX to Linux-Kernel Primitives}
> > \end{table*}
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe perfbook" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

