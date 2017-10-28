Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bQIrG9XDI2uDbzuBKdwCl0NU7xtWyVto6lcHKcYGAew=;
 b=TZU1ncU1iWtjjhAaRIpZNN3/klqbKyyVbMh9YBS5YELh6XTr/NqXH4XXCloKH0EUwB
 NYNKUs+HGKFwpENq0fsvA3vyFzZUPTKfPLaWSW5ZsZmasOLByrHwAsyHbFcFJRZJH0Z3
 uAqgXC5Dl1Q59XfefoUvqSHE0Y9fz8tfxk5L+MHmYXwsWYLupGVo3EhCte6jqvfxC2uI
 OSNMpJslJdGcsRGUdRbJJ9RMMIID4zmY5mSaKlzKt4c2wGR9RSvzXOGnKH1O7Oc+jSRD
 JjyOggZyPvCpPqGbJ1WXRawl4eH8zt2k4Wkn30q073uaaW0HUBsfqVfY7ZY5br139sqQ
 OhRw==
Date: Sat, 28 Oct 2017 16:06:40 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: [PATCH] typo at Chp 7.
Message-ID: <20171028080553.GA5742@HP>
References: <20171027092317.GA8509@HP>
 <bf23f56f-b4e1-48fe-821d-721457cd469e@gmail.com>
 <20171027230549.GS3659@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171027230549.GS3659@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Oct 27, 2017 at 04:05:49PM -0700, Paul E. McKenney wrote:
> On Sat, Oct 28, 2017 at 12:02:19AM +0900, Akira Yokosawa wrote:
> > Hi Yubin,
> > 
> > On 2017/10/27 18:23, Yubin Ruan wrote:
> > > Hi paul,
> > > 
> > > I finish chapter 7 and find some typo. Fixed in the patch below.
> > > 
> > > Yubin
> > > 
> > > diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> > > index 9fcbbf9..c7c4ae8 100644
> > > --- a/locking/locking-existence.tex
> > > +++ b/locking/locking-existence.tex
> > > @@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
> > >  figure, it can be problematic if a given data element can be a member
> > >  of multiple hash tables or given more-complex data structures such
> > >  as trees or graphs.
> > > -These problems can be solved, in fact, such solutions form the basis
> > > +These problems can be solved. In fact, such solutions form the basis
> > 
> > I'd suggest the following:
> > 
> > +These problems can be solved, in fact, and such solutions form the basis
> 
> How about this?
> 
> 	Not only can these problems be solved, but the solutions also
> 	form the basis of lock-based software transactional memory [...].

Thanks for your suggestion. I think Akira's approach looks more nature to me.
So, let me finish this little patch ;-)

Yubin

--------------------------------------------------------------------------
From aede1ef2fe8c5213c8aec9581192c5915e69010c Mon Sep 17 00:00:00 2001
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sat, 28 Oct 2017 16:00:43 +0800
Subject: [PATCH] locking: a typo fixed

Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
---
 locking/locking-existence.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 9fcbbf9..2be69d8 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
 figure, it can be problematic if a given data element can be a member
 of multiple hash tables or given more-complex data structures such
 as trees or graphs.
-These problems can be solved, in fact, such solutions form the basis
+These problems can be solved, in fact, and such solutions form the basis
 of lock-based software transactional memory
 implementations~\cite{Shavit95,DaveDice2006DISC}.
 However,
-- 
2.7.4

