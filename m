Return-Path: <SRS0=ummk=AV=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682888845; x=1685480845;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f2pwqA+aOzDNEggNy6HbbIHnaLrvNiadqYvwYQffduc=;
        b=ZB4xF8u6g+I6jgcqpIp6o7WawE2l3RPZGNEeMbb6F1MNmU2fH5IQXX2K3qjyQU1anD
         vpd+6YnvtU1/CgwpKxis8cwDAlAJPzB9K9UfrYv5Cau6hJ3pfYvs/3CV+OPxLxqgOUU+
         eG+/S3kaNvrA4nFL3GamwPaEOpavSKHU2E/6hELX2sLg7AO4h1KD91vFvuXW758lyikx
         lE6/o+bzChXpEsSH6rq2psq4nPfNU+O5lN3LcyWwRhzDTIJwgyl+Rk+VgpjQb9FGNQVI
         1OlADXlLNOuU89Tkq9VXj8flOaXM/1vuiun9dEN9HII3k8uo+zc/dt3UPd5R9pVqNpgC
         SOpg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 1/2] together/refcnt: Use \tco{} for code quoting
Date: Sun, 30 Apr 2023 14:07:22 -0700
Message-Id: <20230430210722.6751-1-sj@kernel.org>
In-Reply-To: <fc00737f-e793-4530-8074-56b3e8ba5d3c@paulmck-laptop>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, SeongJae Park <sj38.park@gmail.com>, SeongJae Park <sj@kernel.org>, "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hi Akira and Paul,

On Sat, 29 Apr 2023 20:17:25 -0700 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Sun, Apr 30, 2023 at 12:12:24PM +0900, Akira Yokosawa wrote:
> > On Sat, 29 Apr 2023 16:38:12 -0700, SeongJae Park wrote:
> > > Hi Akira,
> > > 
> > > On Sun, 30 Apr 2023 07:20:48 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
> > > 
> > >> Hi,
> > >>
> > >> On Sat, 29 Apr 2023 10:02:25 -0700, SeongJae Park wrote:
> > >>> From: SeongJae Park <sj38.park@gmail.com>
> > >>>
> > >>> Some sentences in refcnt.tex is using only quote for some code words.
> > >>> Use \tco{} instead, as it is intended to be used for the case.
> > >>
> > >> \tco{} doesn't put quotes around it.
> > >> Didn't you mean \qco{} ?
> > > 
> > > You're correct, I was out of my mind.  I also mistakenly used an email account
> > > that different from what I signed patches off.  I will send a new spin
> > > tomorrow.
> > 
> > Looks like Paul has already pulled and pushed this (commit 0e96cb8283ca).
> > 
> > Can you send a fix on top ?
> 
> Or I can remove that commit if that makes things easier.  When you send
> me the patch, please just let me know if it is to replace 0e96cb8283ca
> or to go on top of it.  Your choice!  ;-)

Sorry, I found this mail after I sent the patch.  Just for a record.  I sent
the patch on top of it.  If you'd prefer to, please feel free to squash it into
the old one.  I have no preference but just want to make the trivial nit fixed.

> 
> And thank you, Akira, for checking.

Thank you all.


Thanks,
SJ

> 
> 							Thanx, Paul
> 
> >         Thanks, Akira
> > 
> > > 
> > > 
> > > Thanks,
> > > SJ
> > > 
> > >>
> > >>         Thanks, Akira
> > >>
> > >>>
> > >>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > >>> ---
> > >>>  together/refcnt.tex | 8 ++++----
> > >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/together/refcnt.tex b/together/refcnt.tex
> > >>> index 56caed67..4abe1c60 100644
> > >>> --- a/together/refcnt.tex
> > >>> +++ b/together/refcnt.tex
> > >>> @@ -467,15 +467,15 @@ as shown below.
> > >>>  
> > >>>  \QuickQuiz{
> > >>>  	Why can't the check for a zero reference count be
> > >>> -	made in a simple ``if'' statement with an atomic
> > >>> -	increment in its ``then'' clause?
> > >>> +	made in a simple \tco{if} statement with an atomic
> > >>> +	increment in its \tco{then} clause?
> > >>>  }\QuickQuizAnswer{
> > >>> -	Suppose that the ``if'' condition completed, finding
> > >>> +	Suppose that the \tco{if} condition completed, finding
> > >>>  	the reference counter value equal to one.
> > >>>  	Suppose that a release operation executes, decrementing
> > >>>  	the reference counter to zero and therefore starting
> > >>>  	cleanup operations.
> > >>> -	But now the ``then'' clause can increment the counter
> > >>> +	But now the \tco{then} clause can increment the counter
> > >>>  	back to a value of one, allowing the object to be
> > >>>  	used after it has been cleaned up.
> > >>>  
