Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tMYEYpspEsYx5eWYgD2iMXT5JduduMbvDKr+gF8CHBM=;
 b=oqQ/7KpAatPvEleCqANnB9I8ZqxwtLLPFf+R04GQIunt/rNf1BtacsaipATIu+Q2mJ
 lfONQTKQoYUafP4re7/WnN8Is37gM1yZALnL7p4idzuoftr9dgTSQ/7J8ak2iRHMyGzP
 3GsnzH57zKWuBrgclAuGllmR+7eKNoZ8sCZW1yTSTBPFV/8DJzTFJ3HkfApcWo2Sgb1R
 nooEVz/oRneRaMxI/2LC7Eiuxt5lHWKRttT7UREdKzONPpd7dIjX/uAkml+eyjOBkcCL
 OS5LIEAKKZ0oI+K8rCkwWWQg81IrnCG9mKZvxJHDhEvPJJbU06XEV5qUE3CxNb9utugw
 G4xg==
Date: Sat, 28 Oct 2017 17:16:56 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: [PATCH] typo at Chp 7.
Message-ID: <20171028091654.GF5742@HP>
References: <20171027092317.GA8509@HP>
 <bf23f56f-b4e1-48fe-821d-721457cd469e@gmail.com>
 <20171027230549.GS3659@linux.vnet.ibm.com> <20171028080553.GA5742@HP>
 <7589cd7e-208c-6f8c-dd98-c587904c0b14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7589cd7e-208c-6f8c-dd98-c587904c0b14@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Oct 28, 2017 at 10:53:31AM +0900, Akira Yokosawa wrote:
> On 2017/10/28 17:06, Yubin Ruan wrote:
> > On Fri, Oct 27, 2017 at 04:05:49PM -0700, Paul E. McKenney wrote:
> >> On Sat, Oct 28, 2017 at 12:02:19AM +0900, Akira Yokosawa wrote:
> >>> Hi Yubin,
> >>>
> >>> On 2017/10/27 18:23, Yubin Ruan wrote:
> >>>> Hi paul,
> >>>>
> >>>> I finish chapter 7 and find some typo. Fixed in the patch below.
> >>>>
> >>>> Yubin
> >>>>
> >>>> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> >>>> index 9fcbbf9..c7c4ae8 100644
> >>>> --- a/locking/locking-existence.tex
> >>>> +++ b/locking/locking-existence.tex
> >>>> @@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
> >>>>  figure, it can be problematic if a given data element can be a member
> >>>>  of multiple hash tables or given more-complex data structures such
> >>>>  as trees or graphs.
> >>>> -These problems can be solved, in fact, such solutions form the basis
> >>>> +These problems can be solved. In fact, such solutions form the basis
> >>>
> >>> I'd suggest the following:
> >>>
> >>> +These problems can be solved, in fact, and such solutions form the basis
> >>
> >> How about this?
> >>
> >> 	Not only can these problems be solved, but the solutions also
> >> 	form the basis of lock-based software transactional memory [...].
> > 
> > Thanks for your suggestion. I think Akira's approach looks more nature to me.
> > So, let me finish this little patch ;-)
> 
> Well, I think Paul's suggestion is much clearer.
> 
> BTW Yubin, your mail has a date field indicating it came from the near future:
> 
> > Date: Sat, 28 Oct 2017 16:06:40 +0800
> 
> May be time zone setting issue?

Thanks Akira, I have correct the time configuration and modify the patch as
follow (as suggested by Paul)

Yubin

-----------------------------------------------------------------------
From ae26699b708e3ccb52c134aecf79d64f8e89a23e Mon Sep 17 00:00:00 2001
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sat, 28 Oct 2017 17:15:06 +0800
Subject: [PATCH] locking: a typo fixed

Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
---
 locking/locking-existence.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 9fcbbf9..6340734 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -174,8 +174,8 @@ single partitionable data structure such as the hash table shown in the
 figure, it can be problematic if a given data element can be a member
 of multiple hash tables or given more-complex data structures such
 as trees or graphs.
-These problems can be solved, in fact, such solutions form the basis
-of lock-based software transactional memory
+Not only can these problems be solved, but the solutions also form
+the basis of lock-based software transactional memory
 implementations~\cite{Shavit95,DaveDice2006DISC}.
 However,
 Chapter~\ref{chp:Deferred Processing}
-- 
2.7.4

