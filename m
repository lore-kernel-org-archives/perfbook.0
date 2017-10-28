Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38538 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751179AbdJ1NXW (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 28
 Oct 2017 09:23:22 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9SDL4qw014992
 for <perfbook@vger.kernel.org>; Sat, 28 Oct 2017 09:23:21 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dvp01gh64-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 28 Oct 2017 09:23:21 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 28 Oct
 2017 09:23:20 -0400
Date: Sat, 28 Oct 2017 06:23:17 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] typo at Chp 7.
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171027092317.GA8509@HP>
 <bf23f56f-b4e1-48fe-821d-721457cd469e@gmail.com>
 <20171027230549.GS3659@linux.vnet.ibm.com> <20171028080553.GA5742@HP>
 <7589cd7e-208c-6f8c-dd98-c587904c0b14@gmail.com> <20171028091654.GF5742@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171028091654.GF5742@HP>
Message-Id: <20171028132317.GX3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 28, 2017 at 05:16:56PM +0800, Yubin Ruan wrote:
> On Sat, Oct 28, 2017 at 10:53:31AM +0900, Akira Yokosawa wrote:
> > On 2017/10/28 17:06, Yubin Ruan wrote:
> > > On Fri, Oct 27, 2017 at 04:05:49PM -0700, Paul E. McKenney wrote:
> > >> On Sat, Oct 28, 2017 at 12:02:19AM +0900, Akira Yokosawa wrote:
> > >>> Hi Yubin,
> > >>>
> > >>> On 2017/10/27 18:23, Yubin Ruan wrote:
> > >>>> Hi paul,
> > >>>>
> > >>>> I finish chapter 7 and find some typo. Fixed in the patch below.
> > >>>>
> > >>>> Yubin
> > >>>>
> > >>>> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> > >>>> index 9fcbbf9..c7c4ae8 100644
> > >>>> --- a/locking/locking-existence.tex
> > >>>> +++ b/locking/locking-existence.tex
> > >>>> @@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
> > >>>>  figure, it can be problematic if a given data element can be a member
> > >>>>  of multiple hash tables or given more-complex data structures such
> > >>>>  as trees or graphs.
> > >>>> -These problems can be solved, in fact, such solutions form the basis
> > >>>> +These problems can be solved. In fact, such solutions form the basis
> > >>>
> > >>> I'd suggest the following:
> > >>>
> > >>> +These problems can be solved, in fact, and such solutions form the basis
> > >>
> > >> How about this?
> > >>
> > >> 	Not only can these problems be solved, but the solutions also
> > >> 	form the basis of lock-based software transactional memory [...].
> > > 
> > > Thanks for your suggestion. I think Akira's approach looks more nature to me.
> > > So, let me finish this little patch ;-)
> > 
> > Well, I think Paul's suggestion is much clearer.
> > 
> > BTW Yubin, your mail has a date field indicating it came from the near future:
> > 
> > > Date: Sat, 28 Oct 2017 16:06:40 +0800
> > 
> > May be time zone setting issue?
> 
> Thanks Akira, I have correct the time configuration and modify the patch as
> follow (as suggested by Paul)

OK, thank you.  But the way you say "as suggested by Paul" is as shown
below, "Suggested-by".  Not at all a big deal in my case, but it is
good to get in practice so that you can help other people get patches
in while still making sure that they get credit.

Also, could you please use "git format-patch" and "git send-email"?
Akira and I can help if the documentation has you confused.  In the
meantime, here are my notes to myself that I use to send out RCU
patches.

If you could redo and resend the patch, I would be very happy to accept it.

------------------------------------------------------------------------
git format-patch -o <dir> -n --subject-prefix="PATCH -tip" <since>[..<until>]

	Create an email-ready patch.  "-n" says to number them.
	Use "git send-email" to send them.

	For typical RCU patch from tip/core/rcu, something like:

		git format-patch -o /tmp/RCU -n --subject-prefix="PATCH tip/core/rcu" to-mingo
		git format-patch -o /tmp/RCU -n --subject-prefix="PATCH RFC tip/core/rcu" to-mingo
		git format-patch -o /tmp/RCU -n --subject-prefix="PATCH tip/core/urgent" to-mingo

	For intended submissions, RFC submissions, and bug fixes,
	respectively.

	Then run scripts/checkpatch.pl on each file in /tmp/RCU:

		scripts/checkpatch.pl /tmp/RCU/*

git send-email --no-chain-reply-to --to linux-kernel@vger.kernel.org --cc email1@address1 --cc email2@address2 file1 file2 ...

	For typical RCU patch, check -next conflicts, then something like:

		mutt linux-kernel@vger.kernel.org -c mingo@kernel.org -c jiangshanlai@gmail.com -c dipankar@in.ibm.com -c akpm@linux-foundation.org -c mathieu.desnoyers@efficios.com -c josh@joshtriplett.org -c tglx@linutronix.de -c peterz@infradead.org -c rostedt@goodmis.org -c dhowells@redhat.com -c edumazet@google.com -c fweisbec@gmail.com -c oleg@redhat.com -s '[PATCH tip/core/rcu 0/N] @@@title@@@'

	Then obtain the message-id of the above email, and:

		git send-email  --in-reply-to="@@@" --no-thread --to linux-kernel@vger.kernel.org --cc mingo@kernel.org --cc jiangshanlai@gmail.com --cc dipankar@in.ibm.com --cc akpm@linux-foundation.org --cc mathieu.desnoyers@efficios.com --cc josh@joshtriplett.org --cc tglx@linutronix.de --cc peterz@infradead.org --cc rostedt@goodmis.org --cc dhowells@redhat.com --cc edumazet@google.com --cc fweisbec@gmail.com --cc oleg@redhat.com /tmp/RCU/*

		# git send-email  --in-reply-to="@@@" --no-chain-reply-to --to linux-kernel@vger.kernel.org --cc mingo@kernel.org --cc jiangshanlai@gmail.com --cc dipankar@in.ibm.com --cc akpm@linux-foundation.org --cc mathieu.desnoyers@efficios.com --cc josh@joshtriplett.org --cc tglx@linutronix.de --cc peterz@infradead.org --cc rostedt@goodmis.org --cc dhowells@redhat.com --cc edumazet@google.com --cc dvhart@linux.intel.com --cc fweisbec@gmail.com --cc oleg@redhat.com --cc bobby.prani@gmail.com /tmp/RCU/*
------------------------------------------------------------------------

> Yubin
> 
> -----------------------------------------------------------------------
> >From ae26699b708e3ccb52c134aecf79d64f8e89a23e Mon Sep 17 00:00:00 2001
> From: Yubin Ruan <ablacktshirt@gmail.com>
> Date: Sat, 28 Oct 2017 17:15:06 +0800
> Subject: [PATCH] locking: a typo fixed
> 
Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
> ---
>  locking/locking-existence.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> index 9fcbbf9..6340734 100644
> --- a/locking/locking-existence.tex
> +++ b/locking/locking-existence.tex
> @@ -174,8 +174,8 @@ single partitionable data structure such as the hash table shown in the
>  figure, it can be problematic if a given data element can be a member
>  of multiple hash tables or given more-complex data structures such
>  as trees or graphs.
> -These problems can be solved, in fact, such solutions form the basis
> -of lock-based software transactional memory
> +Not only can these problems be solved, but the solutions also form
> +the basis of lock-based software transactional memory
>  implementations~\cite{Shavit95,DaveDice2006DISC}.
>  However,
>  Chapter~\ref{chp:Deferred Processing}
> -- 
> 2.7.4
> 

